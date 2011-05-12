class Comment < ActiveRecord::Base
belongs_to :server
belongs_to :user
has_many :comments
end
