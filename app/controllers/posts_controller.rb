class PostsController < ApplicationController
  #layout 'cv', only: [:show]
  layout 'form', only: [:new, :edit]
	before_action :get_post, only: [:edit, :show, :delete, :update, :destroy]
  def index
  	@posts = Post.all
  end

  def edit
  	
  end

  def update
    if @post.update_attributes(post_params)
      redirect_to post_path @post
    else
      render "edit"
    end
  end


  def show
    render :show, layout: 'cv'
  end

  def new
  	@post = Post.new
  end

  def destroy
  	@post.destroy
  	redirect_to posts_path
  end
  

  def create
    @post = Post.new(post_params)
  	if @post.save
      flash[:notice] = "Post created successfully"
      redirect_to post_path @post
    else
      render new_post_path
    end
  end

  private
  def post_params
  	params.require(:post).permit(:first_name, :last_name, :email, :category, :about, :avatar,
      qualifications_attributes: [:id, :post_id, :school, :detail, :grad_yr, :degree, :_destroy], 
      projects_attributes: [:id, :post_id, :name, :project_yr, :description, :_destroy],
       experiences_attributes: [:id, :post_id, :place, :position , :detail, :work_start, :work_end, :current_work, :_destroy], 
       recommendations_attributes: [:id, :name, :position, :email, :post_id, :_destroy],
       others_attributes: [:id, :post_id, :title, :detail],
       skills_attributes: [:id, :post_id, :talent])
  end

  def get_post
  	@post = Post.find(params[:id])
  end
end
