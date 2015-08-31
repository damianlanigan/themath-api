module NotificationsHelper
  def notification_company_name
    Rails.application.secrets.company_name
  end

  def notification_company_address
    Rails.application.secrets.company_address
  end

  def notification_company_logo
    ""
  end

  def privacy_url
    "http://howamidoingapp.com/privacy"
  end

  def terms_url
    "http://howamidoingapp.com/terms"
  end

  def help_url
    "http://howamidoingapp.com/about"
  end

  def recent_notifications
    return @recent_notifications if defined?(@recent_notifications)
    @recent_notifications = current_user && current_user.notifications.recent
  end
end
