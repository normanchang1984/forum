class ProfilesController < ApplicationController

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @forums = @user.favorites
  end

end
