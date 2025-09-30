class ApplicationController < ActionController::Base
  # Temporary fix for CSRF issues in production
  skip_forgery_protection if Rails.env.production?
end
