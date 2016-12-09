class ProjectsController < ApplicationController\
	before_action :get_post
	before_action :get_project, only: [:edit, :update, :delete, :destroy, :show]
  def index
  	@projects = Project.all.where(:post_id => @post.id)
  end

  def new
  	@project = Project.new
  end

  def create
  	@project = Project.new(project_params)
  	if @project.save
  		redirect_to "index"
  	else
  		render "new"
  	end
  end

  def edit

  end

  def update
  	if @project.update_attributes(project_params)
  		redirect_to "index"
  	else
  		render "edit"
  	end
  end

  def destroy
  	@project.destroy
  	render "index"
  end

  def show
  end

  private
  def get_post
  	@post = Post.find(params[:post_id])
  end

  def get_project
  	@project = Project.find(params[:id])
  end

  def project_params
  	params.require(:project).permit(:name, :project_yr, :description, :post_id)
  end


end
