class LeaguesController < ApplicationController
    before_action :authenticate_user!
    def index
        id = current_user.league_id
        @lega = League.find(current_user.league_id)
        #debugger
    end

    def new
        @league = League.new
        authorize! :new, @league, :message => "Fai già parte di una lega"
    end

    def create
        authorize! :create, League, :message => "Fai già parte di una lega"
        @user = current_user
		@league = League.new(params[:league].permit(:name, :players, :status, :description, :user))
        @league.president_id = @user.id
        @league.status = "Aperta"
        if current_user.roles_mask == 1                                         #notdefined
            if @league.save!
                flash[:notice] = "#{@league.name} was successfully created."
                 current_user.update_attributes(:roles_mask => 2)               #diventa presidente
                 current_user.update_attributes(:league_id => @league.id)
            else
                render new_league_path
            end
        end
		redirect_to leagues_path
	end

end
