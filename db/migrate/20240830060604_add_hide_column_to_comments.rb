class AddHideColumnToComments < ActiveRecord::Migration[7.1]
  def change
    add_column :comments, :hide, :boolean, default: false
    Comment.update_all(hide: false)
  end
end
