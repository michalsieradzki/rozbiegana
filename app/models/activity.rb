class Activity < ApplicationRecord
  belongs_to :user, class_name: "User"
  belongs_to :competition, optional: true
  has_one_attached :image
  has_many :comments, dependent: :delete_all
  has_many :likes, dependent: :delete_all
  # has_noticed_notifications model_name: 'Notification', dependent: :delete_all
  has_many :notifications, as: :recipient, dependent: :destroy
  validates :distance, presence: true, numericality: { greater_than_or_equal_to: 5 }


  validates :description, presence: true
  validates :hours, presence: true
  validates :minutes, presence: true
  validates :seconds, presence: true
  validates :image, presence: true

  # Automatyczne przypisanie do aktywnego konkursu i liczenie score
  before_save :assign_to_current_competition
  before_save :set_score

  # Scope'y dla lepszej czytelności i wydajności
  scope :recent, -> { order(created_at: :desc) }
  scope :for_month, ->(month, year = Time.current.year) { 
    start_date = Date.new(year, month, 1).beginning_of_month
    end_date = start_date.end_of_month
    where(created_at: start_date..end_date)
  }
  scope :with_associations, -> { includes(:user, :comments, :likes, :competition, user: :team) }
  scope :top_distance, ->(limit = 10) { order(distance: :desc).limit(limit) }
  scope :top_pace, ->(limit = 10) { 
    select("activities.*, (hours * 3600 + minutes * 60 + seconds) / distance AS pace_calc")
    .order("pace_calc ASC")
    .limit(limit)
  }
  scope :for_competition, ->(competition) { where(competition: competition) }

  def pace
    total_seconds = hours * 3600 + minutes * 60 + seconds
    speed = distance / total_seconds
    pace = 1 / speed
    pace
  end

  def calculate_score
    return 0 if user.team.name == "niesklasyfikowany"
    return 0 unless self.competition 
    
    self.competition.calculate_score_for_activity(self)
  end

  private

  def assign_to_current_competition
    if competition.nil?
      self.competition = Competition.current_main_competition
    end
  end

  def set_score
    self.score = calculate_score
  end

  def destroy_associated_notifications
    # notifications.destroy_all
  end
end
