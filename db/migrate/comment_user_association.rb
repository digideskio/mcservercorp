class CommentUserAssociation < ActiveRecord::Migration
  def self.up
	change_table :comments do |t|
    	t.belongs_to :user
  	end
  end

  def self.down
    change_table :comments do |t|
    	t.remove_belongs_to :user
    end
  end
end
