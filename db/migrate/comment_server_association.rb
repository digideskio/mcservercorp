class CommentServerAssociation < ActiveRecord::Migration
  def self.up
	change_table :comments do |t|
    	t.belongs_to :server
  	end
  end

  def self.down
    change_table :comments do |t|
    	t.remove_belongs_to :server
    end
  end
end
