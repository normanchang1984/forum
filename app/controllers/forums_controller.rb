class ForumsController < ApplicationController

  before_action :authenticate_user!, :except=>[:index]
  before_action :find_forum, :only=>[:edit, :update, :destroy]

  def index
    @forums = Forum.all
    @forums = @forums.where(:status=>1)
     if params[:order] == 'posts_count'
      order_by = "posts_count DESC"
    else
      order_by = "id DESC"
    end

    @forums = @forums.order(order_by)
    @forums = @forums.page(params[:page]).per(5)
    @forum = Forum.new

  end

  def create
    @forum = Forum.new(forum_params)
    @forum.user = current_user



    if @forum.save
      flash[:notice]="Create Succeeded"
      redirect_to forums_path
    else
      @forums=Forum.all
      render :action=>:index
    end
  end

  def update
    if @forum.update(forum_params)
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
  end

  def show

    @forum = Forum.find(params[:id])
    @fav = current_user.userforumships.find_by_forum_id( params[:id] )

    if params[:p_id]
      @post = Post.find(params[:p_id])
    else
      @post = Post.new
    end

    @posts=@forum.posts

    @forum.increment!(:view_count)

  end

  def add_favorite
    @fav = current_user.userforumships.find_by_forum_id( params[:id] )
    unless @fav
      current_user.userforumships.create( :forum_id => params[:id] )
    end

    redirect_to :back
  end

  def remove_favorite
    @fav = current_user.userforumships.find_by_forum_id( params[:id] )
    @fav.destroy

    redirect_to :back
  end

  def latest
    @forums = Forum.all
    @users = User.all
    @posts= Post.all
  end



  protected

  def find_forum
    @forum = current_user.forums.find(params[:id])
  end

  def forum_params
    params.require(:forum).permit(:topic, :body, :user_id, :view_count, :status, :category_ids=>[])
  end

end
