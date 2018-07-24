class HomesController < ApplicationController
    before_action :authenticate_user!
    def index
        @utente = current_user.email
        @leghe = League.all
    end

    def show
		id = params[:id]
		@lega = League.find(id)
    end

    def new
        authorize! :read, Home, :message => "Non puoi accedere alla risorsa selezionata"
    end
end
