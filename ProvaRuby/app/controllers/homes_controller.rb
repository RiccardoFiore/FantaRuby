class HomesController < ApplicationController
    before_action :authenticate_user!
    def index
        @utente = current_user.email
        @leghe = League.all
    end

    def show
		id = params[:id]
		@lega = League.find(id)
        @players = @lega.users
    end

    def update
        id = params[:id]
		@lega = League.find(id)
        if current_user.league_id == nil
            current_user.update_attributes(:roles_mask => 2)        #diventa player
            current_user.update_attributes(:league_id => @lega.id)
        end
        redirect_to leagues_path
    end
end
