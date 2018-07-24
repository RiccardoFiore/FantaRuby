class HomesController < ApplicationController
    before_action :authenticate_user!
    def show
        @prova = "prova"
        @utente = current_user.email
    end
    def new
        authorize! :read, Home, :message => "Non puoi accedere alla risorsa selezionata"
    end
end
