class Competition < ApplicationRecord
  has_many :activities, dependent: :nullify

  validates :name, presence: true
  validates :competition_type, inclusion: { in: %w[points distance pace regularity] }
  validates :start_date, :end_date, presence: true
  validate :end_date_after_start_date

  scope :active, -> { where(is_active: true).where('start_date <= ? AND end_date >= ?', Time.current, Time.current) }
  scope :manually_active, -> { where(is_active: true) }
  scope :in_date_range, -> { where('start_date <= ? AND end_date >= ?', Time.current, Time.current) }
  scope :upcoming, -> { where('start_date > ?', Time.current) }
  scope :finished, -> { where('end_date < ?', Time.current) }

  enum competition_type: {
    points: 'points',        # Konkurs punktowy (obecny system)
    distance: 'distance',    # Konkurs dystansowy (suma km)
    pace: 'pace',           # Konkurs tempo (najlepsze średnie tempo)
    regularity: 'regularity' # Konkurs regularności (aktywność co 2 dni)
  }

  # Główny konkurs punktowy
  def self.current_main_competition
    active.where(is_main: true).first
  end

  # Oblicza punkty dla aktywności wg typu konkursu
  def calculate_score_for_activity(activity)
    return 0 if activity.user.team.name == "niesklasyfikowany"
    
    case competition_type
    when 'points'
      calculate_points_score(activity)
    when 'distance'
      activity.distance.floor
    when 'pace'
      calculate_pace_score(activity)
    when 'regularity'
      calculate_regularity_score(activity)
    else
      0
    end
  end

  def active?
    is_active && Date.current.between?(start_date, end_date)
  end

  def finished?
    Date.current > end_date
  end

  def upcoming?
    Date.current < start_date
  end

  def days_remaining
    return 0 if finished?
    (end_date - Date.current).to_i
  end

  def participants_count
    activities.joins(:user).distinct.count('users.id')
  end

  def total_activities_count
    activities.count
  end

  def average_score
    return 0 if activities.empty?
    activities.average(:score).to_f.round(2)
  end

  private

  def end_date_after_start_date
    return unless start_date && end_date
    errors.add(:end_date, 'musi być po dacie rozpoczęcia') if end_date < start_date
  end

  def calculate_points_score(activity)
    if activity.is_official
      # Oficjalny trening: tylko dystans × points_multiplier (bez bonusu za tempo)
      activity.distance.floor * (points_multiplier || 1.0)
    else
      # Zwykły trening: standardowe punkty z bonusem za tempo
      case activity.pace
      when 0...300 then activity.distance.floor * 3
      when 300...330 then activity.distance.floor * 2.5
      when 330...360 then activity.distance.floor * 2
      when 360...390 then activity.distance.floor * 1.5
      else activity.distance.floor * 1
      end
    end
  end

  def calculate_pace_score(activity)
    # Im lepsze tempo, tym więcej punktów
    pace_in_seconds = activity.pace
    if pace_in_seconds < 300
      100
    elsif pace_in_seconds < 330
      80
    elsif pace_in_seconds < 360
      60
    elsif pace_in_seconds < 390
      40
    else
      20
    end
  end

  def calculate_regularity_score(activity)
    user = activity.user
    recent_activities = user.activities
                           .where(competition: self)
                           .where('created_at >= ?', 3.days.ago)
                           .count
    
    # Bonus za regularność
    if recent_activities >= 2
      activity.distance.floor * 2 # Podwójne punkty za regularność
    else
      activity.distance.floor
    end
  end
end
