class CommentsController < ApplicationController
	before_filter :authenticate_user!
	before_filter :get_parent, :only => [:create,:reply]

	
  # GET /comments
  # GET /comments.xml
  def index
    @comments = Comment.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.xml
  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.xml
  def new
    @comment = Comment.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end

  # POST /comments
  # POST /comments.xml
  def create
   # @server = Server.find(params[:server_id])
		params[:comment]['user'] = current_user 
    @comment = @parent.comments.create(params[:comment])
    redirect_to server_path(@comment.findserver)
    # redirect_to root_path
  end
  
  def reply
    @server = Server.find(params[:server_id])
    @parent = Comment.find(params[:id])
    params[:comment]['user'] = current_user
    @comment = @parent.comments.reply(params[:comment])
    # redirect_to server_path(@server)
  end
  

  # PUT /comments/1
  # PUT /comments/1.xml
  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to(@comment, :notice => 'Comment was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.xml
  def destroy
    @comment = Comment.find(params[:id])
    @server = @comment.findserver
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to server_path(@server) }
      format.xml  { head :ok }
    end
  end
  
  protected
  
  def get_parent
    @parent = Server.find_by_id(params[:server_id]) if params[:server_id]
    @parent = Comment.find_by_id(params[:comment_id]) if params[:comment_id]

    redirect_to root_path unless defined?(@parent)
  end
end
