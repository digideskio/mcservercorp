class Comment < ActiveRecord::Base
  belongs_to :parent, :polymorphic => true
  belongs_to :user
  has_many :comments, :as => :parent

  def findserver
    return @server if defined?(@server)
    @server = parent.is_a?(Server) ? parent : parent.findserver
  end
end
