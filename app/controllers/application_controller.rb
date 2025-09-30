class ApplicationController < ActionController::Base
  # Temporary fix for CSRF issues in production
  skip_forgery_protection if Rails.env.production?
  
  # Fix URL generation for production
  before_action :set_default_url_options if Rails.env.production?
  
  private
  
  def set_default_url_options
    Rails.application.routes.default_url_options = {
      host: 'srv29.mikr.us',
      port: 20168,
      protocol: 'http'
    }
  end
  
  def default_url_options
    if Rails.env.production?
      { host: 'srv29.mikr.us', port: 20168, protocol: 'http' }
    else
      super
    end
  end
end
