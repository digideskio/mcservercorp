class Votes < ActiveRecord::Base
  belongs_to :votable, :polymorphic => :true
  belongs_to :user
  
end
