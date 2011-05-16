class VotesController < ApplicationController
  before_filter :authenticate_user!
  
  

  
  def create
		params[:vote]['user'] = current_user 
    @vote = @parent.votes.create(params[:vote])
    redirect_to server_path(@vote.findserver)
  end
  
  
  protected
  
  def get_parent
    @parent = Server.find_by_id(params[:server_id]) if params[:server_id]
    @parent = Comment.find_by_id(params[:comment_id]) if params[:comment_id]

    redirect_to root_path unless defined?(@parent)
  end
end
