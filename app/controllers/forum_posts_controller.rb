class ForumPostsController < ApplicationController

before_action :find_post, :only=>[:destroy, :create, :edit, :update]

def create

  @post=@forum.posts.build(post_params)
  if @post.save
    flash[:notice]="Create Succeeded"
    redirect_to forum_path(@forum)
  else
    render :action=>:show
  end
end

def destroy
  @post=@forum.posts.find(params[:p_id])
  @post.destroy
  flash[:alert]="Delete Succeeded"
  redirect_to forum_path(@forum)
end

def edit


  redirect_to forum_path(params[:forum_id],:p_id=>params[:p_id], :update=>params[:update])

end

def update
  #Rails.logger.debug("=================")
  #Rails.logger.debug(params.inspect)

  @post=Post.update(params[:p_id], post_params)

  if @post.save
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
