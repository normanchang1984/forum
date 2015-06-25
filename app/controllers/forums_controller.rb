class ForumsController < ApplicationController

  before_action :authenticate_user!, :except=>[:index]
  before_action :find_forum, :only=>[:update, :destroy]

  def index

    @forums = Forum.all
    @forums = params[:order] ? @forums.order("#{params[:order]} DESC") : @forums.order("created_at ASC")
    @forum = Forum.new

  end

  def create
    #Rails.logger.debug("******************")
    #Rails.logger.debug(params.inspect)
    @forum=Forum.new(forum_params)
    if @forum.save
      flash[:notice]="Create Succeeded"
      redirect_to forums_path
    else
      @forums=Forum.all
      render :action=>:index
    end
  end

  def update
    @forum=Forum.update(params[:id],forum_params)
    if @forum.save
      flash[:notice]="Update Succeeded"
      redirect_to forums_path
    else
      render :action=>:edit
    end

  end

  def destroy
    @forum.destroy
    flash[:alert] = "Delete Succeeded"
    redirect_to forums_path
  end

  def edit
    @forum=Forum.find(params[:id])
  end

  def show

    if params[:update].to_i==1

      @forum=Forum.find(params[:id])
      @post=Post.find(params[:p_id])
    else
      @forum=Forum.find(params[:id])
      @post=Post.new
    end
    @posts=@forum.posts
    #Rails.logger.debug("******************")
    #Rails.logger.debug(@post.inspect)
  end

  def latest
    @forums = Forum.all
    @users = User.all
    @posts=Post.all
  end

  protected

  def find_forum
    @forum=Forum.find(params[:id])
  end

  def forum_params

    params.require(:forum).permit(:topic, :body, :category_ids=>[])

  end

end
