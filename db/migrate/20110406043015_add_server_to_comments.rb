class AddServerToComments < ActiveRecord::Migration
  def self.up
    add_column :comments, :server_id, :integer
  end

  def self.down
    remove_column :comments, :server_id, :integer
  end
end
