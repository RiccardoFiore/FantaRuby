class LeaguesController < ApplicationController
    before_action :authenticate_user!

    def index
        id = current_user.league_id
        @lega = League.find(id)
        #debugger
    end

    def show
		id = params[:id]
		@lega = League.find(id)
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
                 current_user.update_attributes!(:roles_mask => 2)               #diventa presidente
                 current_user.update_attributes!(:league_id => @league.id)
            else
                render new_league_path
            end
        end
		redirect_to leagues_path
	end

    def edit
        lid=params[:id]
        @lega=League.find(lid)
        @users=User.where("league_id = ? and league_id != ?",lid,8)
    end

     def update
        @user=current_user
        id=params[:id]
        @lega=League.find(id)
        authorize! :update, @lega, :message => "Non hai i permessi per modificare la lega"
        #gestione cambio presidente
        if @user.admin?
            old_president=User.find(@lega.president_id)
            new_president = User.find(params[:league][:president_id])
            new_president.update_attributes!(:roles_mask => 2)
            old_president.update_attributes!(:roles_mask => 4)
            redirect_to admins_path
         elsif @user.president?
            new_president = User.find(params[:league][:president_id])
            if new_president.id != current_user.id
                new_president.update_attributes!(:roles_mask => 2)
                current_user.update_attributes!(:roles_mask => 4)
            end
            redirect_to edit_league_path(@lega)
        end
        @lega.update_attributes!(params[:league].permit(:president_id))
        ##
        #gestione cambio status lega
        @lega.update_attributes!(params[:league].permit(:status))
        @lega.update_attributes!(params[:league].permit(:description))
        ##

        ##
        #gestione descrizione lega


         ##

         ##


    end


end
