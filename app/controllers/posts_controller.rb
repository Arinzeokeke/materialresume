class PostsController < ApplicationController
  layout 'cv', only: [:show]
	before_action :get_post, only: [:edit, :show, :delete, :update, :destroy]
  def index
  	@posts = Post.all
  end

  def edit
  	
  end

  def update
    if @post.update_attributes(post_params)
      redirect_to root_path
    else
      render "edit"
    end
  end


  def show
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
      redirect_to root_path
    else
      render('new')
    end
  end

  private
  def post_params
  	params.require(:post).permit(:first_name, :last_name, :email, :category, qualifications_attributes: [:id, :post_id, :school, :grad_yr, :degree, :_destroy], projects_attributes: [:id, :post_id, :name, :project_yr, :description, :_destroy], experiences_attributes: [:id, :post_id, :place, :position , :work_start, :work_end, :current_work, :_destroy], recommendations_attributes: [:id, :name, :position, :email, :post_id, :_destroy])
  end

  def get_post
  	@post = Post.find(params[:id])
  end
end
