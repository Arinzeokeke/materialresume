class PostsController < ApplicationController
	before_action :get_post, only: [:edit, :show, :delete, :update, :destroy]
  def index
  	@posts = Post.all
  end

  def edit
  	
  end

  def update
    if @post.update_attributes(post_params)
      decide_redirect
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
      decide_redirect
    else
      render('new')
    end
  end

  private
  def post_params
  	params.require(:post).permit(:first_name, :last_name, :email, :category)
  end

  def get_post
  	@post = Post.find(params[:id])
  end

  def decide_redirect
    if @post.qualifications.count > 0
      redirect_to edit_post_qualification_path(@post.id)
    else
      redirect_to new_post_qualification_path(@post.id)
    end
  end
end
