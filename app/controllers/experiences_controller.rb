class ExperiencesController < ApplicationController
  before_action :get_post

  before_action :get_experience, only: [:edit, :update, :destroy, :show]

  def index
  	@experiences = Experience.all.where(:post_id => @post.id)
  end

  def new
  	@experience = Experience.new
  end

  def create
  	@experience = Experience.new(experience_params)
  	if @experience.save
  		redirect_to new_post_project_path(@post.id)
  	else
  		render "new"
  	end
  end

  def edit
  end

  def update
  	if @experience.update_attributes(experience_params)
  		redirect_to edit_post_project_path(@post.id)
  	else
  		render "edit"
  	end
  end

  def destroy
  	@experience.destroy
  	redirect_to "index"
  end

  private
  def get_post
  	@post = Post.find(params[:post_id])
  end

  def show
  end

  def get_experience
  	@experience = Experience.find(params[:id])
  end

  def experience_params
  	params.require(:experience).permit(:place, :position, :work_start, :work_end, :current_work, :post_id)
  end
end
