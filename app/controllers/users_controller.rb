class UsersController < ApplicationController
	def show
		@users = User.all
		@user = User.find(params[:id])
		@rel = @user.followers.find_by(follower: current_user)
	end
end
