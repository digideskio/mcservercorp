class Votability < ActiveRecord::Migration
  def self.up
    create_table :votes do |t|
      t.references :votable, :polymorphic => true
      t.references :user
    end
    add_column :users, :votecount, :integer
    add_column :servers, :votecount, :integer
  end

  def self.down
    drop_table :votes
    remove_column :users, :votecount
    remove_columns :servers, :votecount
  end
end
