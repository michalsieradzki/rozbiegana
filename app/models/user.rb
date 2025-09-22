class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :team
  has_many :activities, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :room_memberships, dependent: :destroy
  has_many :rooms, through: :room_memberships
  has_many :room_messages, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_many :sent_conversations, class_name: 'Conversation', foreign_key: 'sender_id', dependent: :destroy
  has_many :received_conversations, class_name: 'Conversation', foreign_key: 'recipient_id', dependent: :destroy
  has_one_attached :image

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }, if: :password_required?

  scope :active, -> { where(deleted_at: nil) }
  scope :deleted, -> { where.not(deleted_at: nil) }

  def soft_delete!
    update(deleted_at: Time.current)
  end

  def restore!
    update(deleted_at: nil)
  end

  def deleted?
    deleted_at.present?
  end

  def self.ransackable_attributes(auth_object = nil)
    super + _ransack_aliases.keys + _ransackers.keys
  end

  def conversations
    Conversation.involving(self).includes(:room, :sender, :recipient)
  end
  
  def conversation_with(other_user)
    Conversation.between(self, other_user).first
  end

  def unread_notifications_count
    notifications.unread.count
  end

  def has_unread_notifications?
    unread_notifications_count > 0
  end

  # Notification preferences with defaults
  def notification_preferences
    prefs = read_attribute(:notification_preferences)
    if prefs.blank?
      default_notification_preferences
    else
      # Merge with defaults to ensure all keys exist
      default_notification_preferences.merge(prefs)
    end
  end

  def default_notification_preferences
    {
      'notify_new_activities' => true,
      'notify_comments' => true,
      'notify_competitions' => true,
      'notify_achievements' => true,
      'notify_reminders' => true,
      'notify_weekly_summary' => true
    }
  end

  # Helper methods for notification preferences
  def notification_enabled?(type)
    value = notification_preferences["notify_#{type}"]
    # Handle both boolean true and string "1"
    value == true || value == "1"
  end

  def enable_notification_type(type)
    prefs = notification_preferences
    prefs["notify_#{type}"] = true
    update(notification_preferences: prefs)
  end

  def disable_notification_type(type)
    prefs = notification_preferences
    prefs["notify_#{type}"] = false
    update(notification_preferences: prefs)
  end

  def update_notification_preferences(preferences)
    update(notification_preferences: preferences)
  end

  private

  def password_required?
    new_record? || password.present?
  end
end
