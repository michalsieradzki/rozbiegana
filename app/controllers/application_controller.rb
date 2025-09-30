class ApplicationController < ActionController::Base
  # Temporary fix for CSRF issues in production
  skip_forgery_protection if Rails.env.production?
  
  # Devise authentication
  before_action :authenticate_user!
  
  # Fix URL generation for production
  def default_url_options
    if Rails.env.production?
      { host: 'srv29.mikr.us', port: 20168, protocol: 'http' }
    else
      super
    end
  end
end
