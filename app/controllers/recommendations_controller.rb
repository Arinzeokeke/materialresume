class RecommendationsController < ApplicationController
  before_action :get_post

  before_action :get_recommendation, only: [:edit, :update, :destroy, :show]

  def index
  	@recommendations = Recommendation.all.where(:post_id => @post.id)
  end

  def new
  	@recommendation = Recommendation.new
  end

  def show
  end

  def create
  	@recommendation = Recommendation.new(recommendation_params)
    @recommendation.post_id = params[:post_id]
  	if @recommendation.save
  		redirect_to post_path(@post.id)
  	else
  		render "new"
  	end
  end

  def update
  	if @recommendation.update_attributes(recommendation_params)
  		redirect_to post_path(@post.id)
  	else
  		render "edit"
  	end
  end

  def edit
  end

  def delete
  	@recommendation.destroy
  	redirect_to "index"
  end


  private
  def get_post
  	@post = Post.find(params[:post_id])
  end

  def get_recommendation
  	@recommendation = Recommendation.all.where(:post_id => @post.id).first
  end

  def recommendation_params
  	params.require(:recommendation).permit(:name, :position, :email, :post_id)
  end
end
