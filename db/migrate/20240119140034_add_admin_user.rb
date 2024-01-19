class AddAdminUser < ActiveRecord::Migration[7.1]
  def change
    AdminUser.create!(email: 'michal.sieradzki@mail.com', password: 'Tymon2015', password_confirmation: 'Tymon2015')
  end
end
