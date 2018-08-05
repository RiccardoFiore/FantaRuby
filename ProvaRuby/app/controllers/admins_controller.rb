class AdminsController < ApplicationController
    #load_and_authorize_resource
    def delete_users
        @players = SoccersPlayer
        authorize! :delete_users, Admin, :message => "Non hai i permessi per accedere come admin"
        username = params[:username]
        if username == nil || username == ""
            @users =User.all
        else
            @user = User.find_by_username(username)
        end
    end


    def show

        authorize! :show, Admin, :message => "Non hai i permessi per accedere come admin"
        @admin = User.find(current_user.id)
    end

end

