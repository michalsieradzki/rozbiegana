class Activity < ApplicationRecord
  belongs_to :user, class_name: "User"
  has_one_attached :image
  has_many :comments, dependent: :delete_all
  has_many :likes, dependent: :delete_all
  has_noticed_notifications model_name: 'Notification', dependent: :delete_all
  has_many :notifications, as: :recipient, dependent: :destroy

  validates :distance, presence: true
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
    if user.team == "niesklasyfikowany"
      0
    elsif competition
       distance.floor * 4
    elsif  pace < 301
     distance.floor * 3
    elsif pace >= 301 && pace < 330
       distance.floor * 2.5
    elsif pace >= 330 && pace < 360
     distance.floor * 2
    elsif pace >= 360 && pace < 390
     distance.floor * 1.5
    else 
     distance.floor
    end
  end
  
  private
  
  def destroy_associated_notifications
    notifications.destroy_all
  end
end