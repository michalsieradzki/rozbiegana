class Notification < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :notification_type, inclusion: { in: %w[info success warning error] }

  scope :recent, -> { order(created_at: :desc) }
  scope :unread, -> { where(read: false) }

  def self.create_for_user(user, title, body, notification_type = 'info', data = {})
    # Check if user wants this type of notification
    return false unless user_notification_enabled?(user, notification_type, data)
    
    create!(
      user: user,
      title: title,
      body: body,
      notification_type: notification_type,
      data: data
    )
  end

  def mark_as_read!
    update!(read: true, read_at: Time.current)
  end

  private

  def self.user_notification_enabled?(user, notification_type, data)
    case notification_type
    when 'info'
      # Check specific notification type from data
      notification_key = data['notification_key']
      case notification_key
      when 'new_activity'
        user.notification_enabled?('new_activities')
      when 'comment'
        user.notification_enabled?('comments')
      when 'competition'
        user.notification_enabled?('competitions')
      when 'achievement'
        user.notification_enabled?('achievements')
      when 'reminder'
        user.notification_enabled?('reminders')
      when 'weekly_summary'
        user.notification_enabled?('weekly_summary')
      else
        true # Default to enabled for unknown types
      end
    else
      true # Always show success, warning, error notifications
    end
  end
end