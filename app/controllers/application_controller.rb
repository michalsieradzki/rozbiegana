class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  # before_action :set_notifications, if: :current_user  <- usuwamy

  private

  # Usuwamy całą metodę set_notifications
end
