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

    end
end
