class Commentcounts < ActiveRecord::Migration
  def self.up
    add_column :servers, :numberofcomments, :integer
    add_column :comments, :numberofcomments, :integer
  end

  def self.down
    remove_columns :servers, :numberofcomments, :integer
    remove_columns :comments, :numberofcomments, :integer
  end
end
