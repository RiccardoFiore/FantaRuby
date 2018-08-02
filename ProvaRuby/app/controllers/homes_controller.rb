class HomesController < ApplicationController
    before_action :authenticate_user!
    def index
        authorize! :index, Home, :message => "Fai già parte di una lega"
        @utente = current_user.email
        @leghe = League.all
        #debugger
    end

    def show
        authorize! :show, Home, :message => "Fai già parte di una lega"
		id = params[:id]
		@lega = League.find(id)
        @players = @lega.users
    end

    def create
        @lega = League.find_by(:name => params[:league][:name])
        redirect_to home_path(@lega.id)
    end

    def update
        authorize! :update, Home, :message => "Fai già parte di una lega"
        id = params[:id]
		@lega = League.find(id)
        if current_user.league_id == nil
            current_user.update_attributes!(:roles_mask => 4)            #diventa player
            current_user.update_attributes!(:league_id => @lega.id)
        end
        redirect_to leagues_path
    end
end
