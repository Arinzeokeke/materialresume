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
  	params.require(:post).permit(:first_name, :last_name, :email, :category, qualifications_attributes: [:post_id, :school, :grad_yr, :degree], projects_attributes: [:post_id, :name, :project_yr, :description], experiences_attributes: [:post_id, :place, :position , :work_start, :work_end, :current_work], recommendations_attributes: [:name, :position, :email, :post_id])
  end

  def get_post
  	@post = Post.find(params[:id])
  end

  def decide_redire
    if @post.qualifications.count > 0
      redirect_to edit_post_qualification_path(@post.id)
    else
      redirect_to new_post_qualification_path(@post.id)
    end
  end
end
