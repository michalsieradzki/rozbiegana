class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :activity

  validates :content, presence: true
  after_create_commit :notify_recipient
  before_destroy :cleanup_notifications
  has_noticed_notifications model_name: 'Notification'

  scope :visible, -> { where(hide: false) }

  private

  def notify_recipient
    CommentNotification.with(comment: self, activity: activity).deliver_later(activity.user)
  end

  def cleanup_notifications
    notifications_as_comment.destroy_all
  end
end
