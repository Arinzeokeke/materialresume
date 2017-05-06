class UserSessionsController < ApplicationController
  def new
  	@user =  User.new
  end

  def create
  	if @user = login(params[:email], params[:password])
  		redirect_back_or_to(request.referrer, notice: 'Login Successful')
  	else
  		flash.now[:alert] = 'Login Failed'
      #byebug
  		render  json: {message: 'Password or Email Invalid'} , status: 401
  	end
  end

  def destroy
  	logout
  	redirect_to(:users, notice: 'Logout!')
  end
end
