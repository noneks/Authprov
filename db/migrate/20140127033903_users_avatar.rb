class UsersAvatar < ActiveRecord::Migration
  
  def change
    add_column :users, :image, :string
  end

  def down 
    drop_table :users
  end
end