class Anewlookatcomments < ActiveRecord::Migration
  def self.up
    
    remove_columns :comments, :comments_id, :server_id
    add_column :comments, :parent_id, :integer
    add_column :comments, :parent_type, :string
    add_index :comments, [:parent_id, :parent_type]
    
  end

  def self.down
    add_column :comments, :comments_id, :integer
    add_column :comments, :server_id, :integer
    remove_columns :comments, :parent_id, :parent_type
    remove_index :comments, [:parent_id, :parent_type]
  end
end
