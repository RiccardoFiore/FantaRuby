class LeaguesController < ApplicationController
    before_action :authenticate_user!




    def new
        @league = League.new
    end

    def create
        @user = current_user
		@league = League.new(params[:league].permit(:name, :players, :status, :description, :user))
		#authorize! :create, @league, :message => "BEWARE: You are not authorized to create new movies."
        @league.president_id = @user.id
        @league.status = "Aperta"
        if current_user.roles_mask == 3                                         #notdefined
            if @league.save!
                flash[:notice] = "#{@league.name} was successfully created."
                 current_user.update_attributes(:roles_mask => 1)               #diventa presidente
                 current_user.update_attributes(:league_id => @league.id)
            else
                render new_league_path
            end
        end
		redirect_to leagues_path
	end

end
