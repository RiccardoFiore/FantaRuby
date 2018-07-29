class UsersController < ApplicationController
  
  def show
		@user = User.find(current_user.id)
		if @user.league_id
			@league = League.find(@user.league_id)
		else
			@league = -1
		end
  end
  
end
