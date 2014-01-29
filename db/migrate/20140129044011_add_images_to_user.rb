class AddImagesToUser < ActiveRecord::Migration
  def self.up
    add_attachment :users, :picture
  end

  def self.down
    remove_attachment :userss, :picture
  end
end
