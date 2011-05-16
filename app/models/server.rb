class Server < ActiveRecord::Base
  has_many :comments, :as => :parent
  belongs_to :user
  has_many :users
  has_many :votes
  has_many :users, :through => :votes

  def sumComments
    a = Comments.find_by_server_id(self.id)
    a.count
  end



end
