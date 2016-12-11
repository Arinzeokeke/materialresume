class PostsController < ApplicationController
	before_action :get_post, only: [:edit, :show, :delete]
  def index
  	@posts = Post.all
  end

  def edit
  	
  end

  def update
    if @post.update_attributes(post_params)
      redirect_to edit_post_qualification_path(@post.id)
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
  	redirect_to "index"
  end
  

  def create
    @post = Post.new(post_params)
  	if @post.save
      flash[:notice] = "Post created successfully"
      redirect_to new_post_qualification_path(@post.id)
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
end
