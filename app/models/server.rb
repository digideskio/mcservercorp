class Server < ActiveRecord::Base
has_many :comments
belongs_to :user
has_many :users

  def sumComments
    a = Comments.find_by_server_id(self.id)
    a.count
  end


end
