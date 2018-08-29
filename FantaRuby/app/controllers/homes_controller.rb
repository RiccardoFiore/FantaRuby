class HomesController < ApplicationController
    before_action :authenticate_user!
    def index
        authorize! :index, Home, :message => "Fai già parte di una lega"
        @utente = current_user.email
        @leghe = League.all
    end

    def show
        authorize! :show, Home, :message => "Fai già parte di una lega"
		id = params[:id]
		@lega = League.find(id)
        @players = @lega.users
    end

    def create
        @lega = League.find_by(:name => params[:league][:name])
        if !@lega
            flash[:message] = "Nessuna lega trovata"
            redirect_to homes_path and return
        end
        redirect_to home_path(@lega.id)
    end

    def update
        authorize! :update, Home, :message => "Fai già parte di una lega"
        id = params[:id]
		@lega = League.find(id)
        if current_user.league_id == nil
            @lega.update_attributes!(:players => @lega.players + 1)
            current_user.update_attributes!(:league_id => @lega.id)
        end
        redirect_to new_rose_path + '/portiere'
    end
end
