ActiveAdmin.register Activity do
  filter :created_at
  filter :user
  filter :distance
  filter :score
  
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :distance, :competition, :description, :photo, :user_id, :hours, :minutes, :seconds, :score
  #
  # or
  #
  # permit_params do
  #   permitted = [:distance, :competition, :description, :photo, :user_id, :hours, :minutes, :seconds, :score]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
