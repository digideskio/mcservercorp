class Serversubmitter < ActiveRecord::Migration
  def self.up

  	change_table :servers do |t|
    	t.belongs_to :user
  	end
  end

  def self.down

    change_table :servers do |t|
    	t.remove_belongs_to :user
    end
  end
end
