class UsersController < ApplicationController

  def index
		@user = User.find(current_user.id)
		if @user.league_id
			@league = League.find(@user.league_id)
		else
			@league = -1
		end
  end

  def show
		@user = User.find(params[:id])
		if @user.league_id
			@league = League.find(@user.league_id)
		else
			@league = -1
		end
  end

  def destroy
		User.find(params[:id]).destroy
        flash[:success] = "User destroyed."
        redirect_to '/admins'
  end


end
