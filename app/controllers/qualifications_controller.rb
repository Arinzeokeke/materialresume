class QualificationsController < ApplicationController
  before_action :get_post

  before_action :get_qualification, only: [:edit, :update, :destroy, :show]

  def index
  	@qualifications = Qualification.all.where(:post_id => @post.id)
  end

  def new
  	@qualification = Qualification.new
  end

  def create

  	@qualification = Qualification.new(qualification_params)
    qualification_params.each do |f|
      puts f
    end
    puts params[:post_id]
    @qualification.post_id = params[:post_id]
  	if @qualification.save
      decide_redirect
    else
  		render "new"
  	end
  end
  	
  def show
  end

  def edit

  end

  def update
  	if @qualification.update_attributes(qualification_params)
      decide_redirect
  	else
  		render "edit"
  	end
  end


  def destroy
  	@qualification.destroy
  	redirect_to "index"
  end

   private
  def get_post
  	@post = Post.find(params[:post_id])
  end

  def get_qualification
  	@qualification = Qualification.all.where(:post_id => @post.id).first
  end

  def qualification_params
  	params.require(:qualification).permit(:school, :grad_yr, :degree, :post_id)
  end

  def decide_redirect
    if @post.experiences.count > 0
      redirect_to edit_post_experience_path(@post.id)
    else
      redirect_to new_post_experience_path(@post.id)
    end
  end
end
