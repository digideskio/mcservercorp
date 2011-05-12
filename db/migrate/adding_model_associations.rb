class AddingModelFields < ActiveRecord::Migration
  def self.up
  	
  	change_table :users do |t|

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
  		t.boolean :whitelisted?
  		
  		t.references :users
  	end
  	change_table :comments do |t|

  		t.references :comments
  	end
  end

  def self.down
  	change_table :users do |t|
  		t.remove_belongs_to :server
  	end
  	change_table :servers do |t|
  		t.remove_references :users
   		t.remove :ip_address, :location, :game_mode, :whitelist_url, :mc_address, :port, :status, :whitelisted?

  	end
  	change_table :comments do |t|
  		t.remove_references :comments
  	end
  end
end
