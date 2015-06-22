class ForumsController < ApplicationController
  before_action :find_post

  def index
    @forum=Forum.all
  end

  def create
    @forum=Forum.new
  end

  def update
  end

  def destroy
    @forum.destroy
    flash[:alert] = "刪除成功"
  end

  def edit
  end

  def new
  end

  def show
  end


  protected

  def find_post
    @forum=Forum.find(params[:postid])
  end

  def location_params
    params.require(:location).permit(:name)
  end

end
