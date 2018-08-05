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
        redirect_to admins_path, notice: "Products imported."
    end


    def import_score
        SoccersPlayer.import_score(params[:file])
        redirect_to admins_path, notice: "Products imported."
    end




end
