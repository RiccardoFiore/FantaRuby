class UsersController < ApplicationController

  def show
		@user = User.find(current_user.id)
		if @user.league_id
			@league = League.find(@user.league_id)
		else
			@league = -1
		end
  end

  def show_by_id
		@user = User.find(params[:id])
		if @user.league_id
			@league = League.find(@user.league_id)
		else
			@league = -1
		end
  end

  def update
    user = User.find(current_user.id)
    lega = League.find(user.league_id)
    user.update_attributes!(:league_id => nil)
    if (user.president?)
        if lega.users.size == 0
            League.delete(lega.id)
        else
            next_president = lega.users.first
            lega.update_attributes!(:president_id => next_president.id)
            next_president.update_attributes!(:roles_mask => 2)
        end
    end
    user.update_attributes!(:roles_mask => 1)
    redirect_to homes_path
  end

  def destroy
		User.find(params[:id]).destroy
        flash[:success] = "User destroyed."
        redirect_to '/admins'
  end


end
