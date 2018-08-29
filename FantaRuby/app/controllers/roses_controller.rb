class RosesController < ApplicationController
  before_action :authenticate_user!
	def index
       authorize! :index, Rose, :message => "Hai già creato la tua rosa o non hai i diritti per farlo"
       if(!@rosa = current_user.rose)
           return
       end
       if @rosa.inseriti == 24
          lega = League.find_by(:id => current_user.league_id)
          if lega.president_id == current_user.id
             current_user.update_attributes!(:roles_mask => 2)               #diventa presidente
          else
             current_user.update_attributes!(:roles_mask => 4)               #diventa player
          end
          redirect_to leagues_path
      else
          redirect_to '/roses/new/portiere'
      end
	end

	def new
      authorize! :new, Rose, :message => "Hai già creato la tua rosa o non hai i diritti per farlo"
      if(!@rosa = current_user.rose)
        @rosa = Rose.new(:user_id => current_user.id)
        @rosa.save
      end
      @ruolo = "portiere"
      if params[:role] != nil
        @ruolo = params[:role]
        @ruolo = @ruolo.downcase
        if params[:SoccerPlayers] != nil && params[:SoccerPlayers] != ""
            @soc_plyrs = SoccersPlayer.where(:ruolo => @ruolo, :cognome => params[:SoccerPlayers].upcase)
        else
            @soc_plyrs = SoccersPlayer.where(:ruolo => @ruolo)
        end
        @all_s_p = SoccersPlayer.all
        return
      end
      @ruolo = params[:ruolo]
      @all_s_p = SoccersPlayer.all
      @soc_plyrs = SoccersPlayer.where(:ruolo => @ruolo)

      #controllo se arrivo alla new per la prima volta oppure è il refresh per l'inserimento
      #del giocatore
      if(!params[:id])
        return
      end
      ###
      #cerco il giocatore che devo inserire e che mi è stato passato come params[:id]
      ###
      player = SoccersPlayer.find_by(:id => params[:id])

      ###
      #controllo sul budget
      ###
      if player.quotazione <= current_user.budget - 24 + @rosa.inseriti + 1                 ##24 è il numero tot di players da inserire
          if(player.ruolo == "portiere")
            if(@rosa.portiere1 == nil && !already_in(player.ruolo, @rosa ,player.id))
                @rosa.portiere1 = player.id
                @rosa.inseriti += 1
            elsif(@rosa.portiere2 == nil && !already_in(player.ruolo, @rosa ,player.id))
                @rosa.portiere2 = player.id
                @rosa.inseriti += 1
            elsif(@rosa.portiere3 == nil && !already_in(player.ruolo, @rosa ,player.id))
                @rosa.portiere3 = player.id
                @rosa.inseriti += 1
            else
                if !already_in(player.ruolo, @rosa ,player.id)
                    flash[:danger] = "ATTENZIONE!!! hai già inserito  tutti i portieri"
                    redirect_to '/roses/new/'+ player.ruolo.to_s and return
                else
                    flash[:danger] = "ATTENZIONE!!! Non puoi scegliere due volte lo stesso giocatore"
                    redirect_to '/roses/new/'+ player.ruolo.to_s and return
                end
            end
            @rosa.save
            #redirect_to '/roses/new/' + player.id.to_s
          #controllo per difensore
          elsif(player.ruolo == "difensore")
            if(@rosa.difensore1 == nil && !already_in(player.ruolo, @rosa ,player.id))
                @rosa.difensore1 = player.id
                @rosa.inseriti += 1
            elsif(@rosa.difensore2 == nil && !already_in(player.ruolo, @rosa ,player.id))
                @rosa.difensore2 = player.id
                @rosa.inseriti += 1
            elsif(@rosa.difensore3 == nil && !already_in(player.ruolo, @rosa ,player.id))
                @rosa.difensore3 = player.id
                @rosa.inseriti += 1
            elsif(@rosa.difensore4 == nil && !already_in(player.ruolo, @rosa ,player.id))
                @rosa.difensore4 = player.id
                @rosa.inseriti += 1
            elsif(@rosa.difensore5 == nil && !already_in(player.ruolo, @rosa ,player.id))
                @rosa.difensore5 = player.id
                @rosa.inseriti += 1
            elsif(@rosa.difensore6 == nil && !already_in(player.ruolo, @rosa ,player.id))
                @rosa.difensore6 = player.id
                @rosa.inseriti += 1
            elsif(@rosa.difensore7 == nil && !already_in(player.ruolo, @rosa ,player.id))
                @rosa.difensore7 = player.id
                @rosa.inseriti += 1
            else
                if !already_in(player.ruolo, @rosa ,player.id)
                    flash[:danger] = "ATTENZIONE!!! hai già inserito  tutti i difensori"
                    redirect_to '/roses/new/'+ player.ruolo.to_s and return
                else
                    flash[:danger] = "ATTENZIONE!!! Non puoi scegliere due volte lo stesso giocatore"
                    redirect_to '/roses/new/'+ player.ruolo.to_s and return
                end
            end
            @rosa.save
          #controllo per centrocampista
          elsif(player.ruolo == "centrocampista")
            if(@rosa.centrocampista1 == nil && !already_in(player.ruolo, @rosa ,player.id))
                @rosa.centrocampista1 = player.id
                @rosa.inseriti += 1
            elsif(@rosa.centrocampista2 == nil && !already_in(player.ruolo, @rosa ,player.id))
                @rosa.centrocampista2 = player.id
                @rosa.inseriti += 1
            elsif(@rosa.centrocampista3 == nil && !already_in(player.ruolo, @rosa ,player.id))
                @rosa.centrocampista3 = player.id
                @rosa.inseriti += 1
            elsif(@rosa.centrocampista4 == nil && !already_in(player.ruolo, @rosa ,player.id))
                @rosa.centrocampista4 = player.id
                @rosa.inseriti += 1
            elsif(@rosa.centrocampista5 == nil && !already_in(player.ruolo, @rosa ,player.id))
                @rosa.centrocampista5 = player.id
                @rosa.inseriti += 1
            elsif(@rosa.centrocampista6 == nil && !already_in(player.ruolo, @rosa ,player.id))
                @rosa.centrocampista6 = player.id
                @rosa.inseriti += 1
            elsif(@rosa.centrocampista7 == nil && !already_in(player.ruolo, @rosa ,player.id))
                @rosa.centrocampista7 = player.id
                @rosa.inseriti += 1
            elsif(@rosa.centrocampista8 == nil && !already_in(player.ruolo, @rosa ,player.id))
                @rosa.centrocampista8 = player.id
                @rosa.inseriti += 1
            else
                if !already_in(player.ruolo, @rosa ,player.id)
                    flash[:danger] = "ATTENZIONE!!! hai già inserito  tutti i centrocampisti"
                    redirect_to '/roses/new/'+ player.ruolo.to_s and return
                else
                    flash[:danger] = "ATTENZIONE!!! Non puoi scegliere due volte lo stesso giocatore"
                    redirect_to '/roses/new/'+ player.ruolo.to_s and return
                end
            end
            @rosa.save
            #redirect_to '/roses/new/' + player.id.to_s
            #controllo per attaccante
          elsif(player.ruolo == "attaccante")
            if(@rosa.attaccante1 == nil && !already_in(player.ruolo, @rosa ,player.id))
                @rosa.attaccante1 = player.id
                @rosa.inseriti += 1
            elsif(@rosa.attaccante2 == nil && !already_in(player.ruolo, @rosa ,player.id))
                @rosa.attaccante2 = player.id
                @rosa.inseriti += 1
            elsif(@rosa.attaccante3 == nil && !already_in(player.ruolo, @rosa ,player.id))
                @rosa.attaccante3 = player.id
                @rosa.inseriti += 1
            elsif(@rosa.attaccante4 == nil && !already_in(player.ruolo, @rosa ,player.id))
                @rosa.attaccante4 = player.id
                @rosa.inseriti += 1
            elsif(@rosa.attaccante5 == nil && !already_in(player.ruolo, @rosa ,player.id))
                @rosa.attaccante5 = player.id
                @rosa.inseriti += 1
            elsif(@rosa.attaccante6 == nil && !already_in(player.ruolo, @rosa ,player.id))
                @rosa.attaccante6 = player.id
                @rosa.inseriti += 1
            else
                if !already_in(player.ruolo, @rosa ,player.id)
                    flash[:danger] = "ATTENZIONE!!! hai già inserito  tutti gli attaccanti"
                    redirect_to '/roses/new/'+ player.ruolo.to_s and return
                else
                    flash[:danger] = "ATTENZIONE!!! Non puoi scegliere due volte lo stesso giocatore"
                    redirect_to '/roses/new/'+ player.ruolo.to_s and return
                end
            end
            @rosa.save
            #redirect_to '/roses/new/' + player.id.to_s
          end
          current_user.update_attributes(:budget => current_user.budget - player.quotazione)
          redirect_to '/roses/new/'+ player.ruolo.to_s
      else
        flash[:danger] = "ATTENZIONE!!! Budget insufficiente"
        return
      end
    end

    def delete_d
        redirect_to rose_path(@rose.user_id)
    end

	def destroy
      authorize! :destroy, Rose, :message => "La rosa non può essere più modificata"
      rosa = current_user.rose
      r = []
      id = []
      r[0] = 'portiere1'
      r[1] = 'portiere2'
      r[2] = 'portiere3'
	  r[3] = 'difensore1'
	  r[4] = 'difensore2'
	  r[5] = 'difensore3'
	  r[6] = 'difensore4'
	  r[7] = 'difensore5'
	  r[8] = 'difensore6'
	  r[9] = 'difensore7'
	  r[10] = 'centrocampista1'
	  r[11] = 'centrocampista2'
	  r[12] = 'centrocampista3'
	  r[13] = 'centrocampista4'
	  r[14] = 'centrocampista5'
	  r[15] = 'centrocampista6'
	  r[16] = 'centrocampista7'
	  r[17] = 'centrocampista8'
	  r[18] = 'attaccante1'
	  r[19] = 'attaccante2'
	  r[20] = 'attaccante3'
	  r[21] = 'attaccante4'
	  r[22] = 'attaccante5'
	  r[23] = 'attaccante6'

      id[0] =	rosa.portiere1
      id[1] =	rosa.portiere2
      id[2] =	rosa.portiere3
	  id[3] = rosa.difensore1
	  id[4] = rosa.difensore2
	  id[5] = rosa.difensore3
	  id[6] = rosa.difensore4
	  id[7] = rosa.difensore5
	  id[8] = rosa.difensore6
	  id[9] = rosa.difensore7
	  id[10] = rosa.centrocampista1
	  id[11] = rosa.centrocampista2
	  id[12] = rosa.centrocampista3
	  id[13] = rosa.centrocampista4
	  id[14] = rosa.centrocampista5
	  id[15] = rosa.centrocampista6
	  id[16] = rosa.centrocampista7
	  id[17] = rosa.centrocampista8
	  id[18] = rosa.attaccante1
	  id[19] = rosa.attaccante2
	  id[20] = rosa.attaccante3
	  id[21] = rosa.attaccante4
	  id[22] = rosa.attaccante5
	  id[23] = rosa.attaccante6
	  for i in (0..23)
			if(id[i] == params[:id].to_i)
				rosa[r[i]]  = nil
			end
	  end
      rosa.inseriti -= 1
	  rosa.save
      flash[:success] = "Giocatore eliminato"
      player = SoccersPlayer.find_by(:id => params[:id])
      current_user.update_attributes!(:budget => current_user.budget + player.quotazione)
      ruolo = player.ruolo
	  redirect_to '/roses/new/' + ruolo.to_s
	end

    private

    def already_in(ruolo, rosa, id)
      if ruolo == "portiere"
        if rosa.portiere1 != nil && id == rosa.portiere1
            return true
        elsif rosa.portiere2 != nil && id == rosa.portiere2
            return true
        elsif rosa.portiere3 != nil && id == rosa.portiere3
            return true
        end
      elsif ruolo == "difensore"
        if rosa.difensore1 != nil && id == rosa.difensore1
            return true
        elsif rosa.difensore2 != nil && id == rosa.difensore2
            return true
        elsif rosa.difensore3 != nil && id == rosa.difensore3
            return true
        elsif rosa.difensore4 != nil && id == rosa.difensore4
            return true
        elsif rosa.difensore5 != nil && id == rosa.difensore5
            return true
        elsif rosa.difensore6 != nil && id == rosa.difensore6
            return true
        elsif rosa.difensore7 != nil && id == rosa.difensore7
            return true
        end
      elsif ruolo == "centrocampista"
        if rosa.centrocampista1 != nil && id == rosa.centrocampista1
            return true
        elsif rosa.centrocampista2 != nil && id == rosa.centrocampista2
            return true
        elsif rosa.centrocampista3 != nil && id == rosa.centrocampista3
            return true
        elsif rosa.centrocampista4 != nil && id == rosa.centrocampista4
            return true
        elsif rosa.centrocampista5 != nil && id == rosa.centrocampista5
            return true
        elsif rosa.centrocampista6 != nil && id == rosa.centrocampista6
            return true
        elsif rosa.centrocampista7 != nil && id == rosa.centrocampista7
            return true
        elsif rosa.centrocampista8 != nil && id == rosa.centrocampista8
            return true
        end
      else
        if rosa.attaccante1 != nil && id == rosa.attaccante1
            return true
        elsif rosa.attaccante2 != nil && id == rosa.attaccante2
            return true
        elsif rosa.attaccante3 != nil && id == rosa.attaccante3
            return true
        elsif rosa.attaccante4 != nil && id == rosa.attaccante4
            return true
        elsif rosa.attaccante5 != nil && id == rosa.attaccante5
            return true
        elsif rosa.attaccante6 != nil && id == rosa.attaccante6
            return true
        end
      end
      return false
    end

end
