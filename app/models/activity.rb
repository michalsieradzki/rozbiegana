class Activity < ApplicationRecord
  belongs_to :user, class_name: "User"
  has_one_attached :image
  has_many :comments, dependent: :delete_all
  has_many :likes, dependent: :delete_all
  # has_noticed_notifications model_name: 'Notification', dependent: :delete_all
  has_many :notifications, as: :recipient, dependent: :destroy

  validates :distance, presence: true, numericality: { greater_than_or_equal_to: 5 }

  validate :distance_in_competition



  validates :description, presence: true
  validates :hours, presence: true
  validates :minutes, presence: true
  validates :seconds, presence: true
  validates :image, presence: true
  #before_destroy :destroy_associated_notifications
  def pace
    total_seconds = hours * 3600 + minutes * 60 + seconds
    speed = distance / total_seconds
    pace = 1 / speed
    pace
  end

  def calculate_score
    return 0 if user.team == "niesklasyfikowany"

    if competition
      distance.floor * 5
    else
      base_score = case pace
                   when 0...300 then distance.floor * 3
                   when 300...330 then distance.floor * 2.5
                   when 330...360 then distance.floor * 2
                   when 360...390 then distance.floor * 1.5
                   else distance.floor * 1
                   end
      base_score
    end
  end

  private
  def distance_in_competition
    if competition && distance > 10.0
      errors.add(:distance, "Dystans na oficjalnym treningu nie może być większy niż 10 kilometrów.")
    end
  end
  def destroy_associated_notifications
    notifications.destroy_all
  end
end
