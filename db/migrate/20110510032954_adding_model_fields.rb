class AddingModelFields < ActiveRecord::Migration
  def self.up
  	
  	change_table :users do |t|
  		t.string :location
  		t.string :mc_username
  		t.string :website
  		t.integer :server_count
  		t.integer :comment_count
  		t.date :birthday
  		
  		t.belongs_to :server
  	end
  	change_table :servers do |t|
  		t.string :ip_address
  		t.string :location
  		t.string :game_mode
  		t.string :whitelist_url
  		t.string :mc_address
  		t.integer :port
  		t.boolean :status
  		t.boolean :whitelisted
  		
  		t.references :users
  	end
  	change_table :comments do |t|
  		t.boolean :has_been_edited
  		
  		t.references :comments
  	end
  end

  def self.down
  	change_table :users do |t|
  		t.remove :location, :mc_username, :website, :server_count, :comment_count, :birthday
  		t.remove_belongs_to :server
  	end
  	change_table :servers do |t|
  		t.remove :ip_address, :location, :game_mode, :whitelist_url, :mc_address, :port, :status, :whitelisted
  		t.remove_references :users
  	end
  	change_table :comments do |t|
  		t.remove :has_been_edited
  		t.remove_references :comments
  	end
  end
end
