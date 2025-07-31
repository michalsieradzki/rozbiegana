class Admin::ApplicationController < ApplicationController
  before_action :authenticate_admin!
  
  layout 'admin'
  
  protected
  
  def authenticate_admin!
    redirect_to root_path, alert: 'Brak uprawnień administratora.' unless current_user&.admin?
  end
end