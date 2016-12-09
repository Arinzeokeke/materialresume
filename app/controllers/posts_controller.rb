class PostsController < ApplicationController
	before_action :get_post, only: [:edit, :show, :create, :delete]
  def index
  	@posts = Post.all
  end

  def edit
  	
  end

  def show
  end

  def new
  	@post = Post.new
  end

  def delete
  	@post.destroy
  	redirect_to "index"
  end
  

  def create
  	if @post.save
      flash[:notice] = "Post created successfully"
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  private
  def post_params
  	params.require(:post).permit(:first_name, :last_name, :email)
  	
  end

  def get_post
  	@post = Post.find(params[:id])
  end
end
