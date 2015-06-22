class ForumsController < ApplicationController
  before_action :find_post, :only=>[:update, :destroy]

  def index

    @forums=Forum.all

    @forum=Forum.new
  end

  def create
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
    @forum=Forum.find(params[:id])
  end


  protected

  def find_post
    @forum=Forum.find(params[:id])
  end

  def forum_params

    params.require(:forum).permit(:topic, :body)

  end

end
