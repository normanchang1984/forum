class ForumPostsController < ApplicationController

before_action :authenticate_user!
before_action :find_post

def create
  @post = @forum.posts.build(post_params)
  @post.user = current_user

  if @post.save
    flash[:notice]="Create Succeeded"
    redirect_to forum_path(@forum)
  else
    render :action=>:show
  end
end

def destroy
  @post = current_user.posts.find(params[:id])
  @post.destroy

  flash[:alert]="Delete Succeeded"
  redirect_to forum_path(@forum)
end

def update
  @post = current_user.posts.find(params[:id])

  if @post.update( post_params )
    flash[:notice]="Update Succeeded"
    redirect_to forum_path(@forum)
  else
      render :action=>:edit
  end
end

protected

def find_post
  @forum=Forum.find(params[:forum_id])
end

def post_params

    params.require(:post).permit(:content, :user_id)

end
end
