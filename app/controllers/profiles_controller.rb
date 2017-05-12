class ProfilesController < ApplicationController
	#layout one
	def index
		
	end

	def show
		@user = User.find(params[:id])
	end
end
