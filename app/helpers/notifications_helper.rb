module NotificationsHelper
  def create_notification_for_user(user, title, body = nil, type = 'info', data = {})
    Notification.create_for_user(user, title, body, type, data)
  end

  def notification_icon(type)
    case type
    when 'success'
      'bi-check-circle-fill text-success'
    when 'warning'
      'bi-exclamation-triangle-fill text-warning'
    when 'error'
      'bi-x-circle-fill text-danger'
    else
      'bi-info-circle-fill text-info'
    end
  end
end
