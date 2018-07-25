class HomesController < ApplicationController
    before_action :authenticate_user!
    def index
        @utente = current_user.email
        @leghe = League.all
    end

    def show
		id = params[:id]
		@lega = League.find(id)
        if current_user.league_id == nil
            current_user.update_attributes(:roles_mask => 2)        #diventa player
        end
    end

    def new

    end
end
