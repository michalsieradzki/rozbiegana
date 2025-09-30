class ApplicationController < ActionController::Base
  # Temporary fix for CSRF issues in production
  skip_forgery_protection if Rails.env.production?
  
  # Devise authentication
  before_action :authenticate_user!
  
  # Fix URL generation for production - FORCE override
  def default_url_options
    if Rails.env.production?
      { host: 'srv29.mikr.us', port: 20168, protocol: 'http' }
    else
      super
    end
  end
  
  # FORCE OVERRIDE redirect_to method
  def redirect_to(options = {}, response_options_and_flash = {})
    if Rails.env.production?
      # Jesli to jest path helper (symbol lub string zaczynający się od /)
      if options.is_a?(String)
        if options.start_with?('/') && !options.include?('20168')
          options = "http://srv29.mikr.us:20168#{options}"
        elsif options.start_with?('http://srv29.mikr.us') && !options.include?('20168')
          options = options.gsub('http://srv29.mikr.us', 'http://srv29.mikr.us:20168')
        end
      end
    end
    super(options, response_options_and_flash)
  end
  
  # Override Devise redirect path after login
  def after_sign_in_path_for(resource)
    if Rails.env.production?
      "http://srv29.mikr.us:20168/"
    else
      stored_location_for(resource) || root_path
    end
  end
  
  # Override Devise redirect path after logout
  def after_sign_out_path_for(resource_or_scope)
    if Rails.env.production?
      "http://srv29.mikr.us:20168/"
    else
      root_path
    end
  end
end
