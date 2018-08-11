class SoccersPlayersController < ApplicationController
    def index
        respond_to do |format|
        format.html
        format.csv { send_data @s_players.to_csv }
        format.xls  #{ send_data @s_players.to_csv }
        end
    end

    def import
        SoccersPlayer.import(params[:file])
        redirect_to '/admins/delete/users', notice: "Products imported."
    end


    def import_score
        SoccersPlayer.import_score(params[:file])
        if League.first == nil
            votes_day=0
        else
            votes_day = League.first.votes_day
            League.update_all(:votes_day => votes_day + 1)
        end
        redirect_to '/admins/delete/users', notice: "Products imported."
    end

    def edit
        authorize! :edit, SoccersPlayer, :message => "Non hai i permessi per modificare un soccers_player"
        if params[:SoccerPlayers]
            @s_p = SoccersPlayer.find_by(:cognome => params[:SoccerPlayers].upcase)
        end
    end

    def update
        authorize! :update, SoccersPlayer, :message => "Non hai i permessi per modificare un soccers_player"
        new_q = params[:quotazione].to_i
        player = SoccersPlayer.find_by(:cod => params[:id])
        player.update_attributes!(:quotazione => new_q)
        redirect_to edit_soccers_player_path
    end


end
