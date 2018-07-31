class AdminsController < ApplicationController
    #load_and_authorize_resource
    def index
        authorize! :index, Admin, :message => "Non hai i permessi per accedere come admin"
        @users=User.all
    end

    def show
        authorize! :show, Admin, :message => "Non hai i permessi per accedere come admin"
        @admin = User.find(current_user.id)
    end

end

