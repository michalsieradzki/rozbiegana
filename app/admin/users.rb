ActiveAdmin.register User do
  filter :name
  filter :team
  filter :email

  index do
    selectable_column
    id_column
    column :username
    column :email
    column :team
    # Dodaj inne kolumny, które chcesz wyświetlić

    actions
  end
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :email, :username, :team_id, :admin

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :email
      # f.input :password, required: false
      # f.input :password_confirmation, required: false
      f.input :team_id, as: :select, collection: Team.all
      f.input :username
    end
    f.actions
  end
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :username, :team_id, :admin]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
