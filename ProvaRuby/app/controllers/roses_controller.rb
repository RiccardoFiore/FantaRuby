class RosesController < ApplicationController
    before_action :authenticate_user!
	 def index

        id = current_user.id
        @rose = Rose.find(id)

	@socce= SoccersPlayer.all


         end
	def show
          id = params[:id]
		@rose = Rose.all
                @socce= @socce = SoccersPlayer.all
		@rose=@rose.find_by_user_id(id)
                if @rose!=nil
	        @p1=@socce.find(@rose.portiere1)
		@p2=@socce.find(@rose.portiere2)
		@p3=@socce.find(@rose.portiere3)
		@d1=@socce.find(@rose.difensore1)
		@d2=@socce.find(@rose.difensore2)
		@d3=@socce.find(@rose.difensore3)
		@d4=@socce.find(@rose.difensore4)
		@d5=@socce.find(@rose.difensore5)
		@d6=@socce.find(@rose.difensore6)
		@d7=@socce.find(@rose.difensore7)
		@c1=@socce.find(@rose.centrocampista1)
		@c2=@socce.find(@rose.centrocampista2)
		@c3=@socce.find(@rose.centrocampista3)
		@c4=@socce.find(@rose.centrocampista4)
		@c5=@socce.find(@rose.centrocampista5)
		@c6=@socce.find(@rose.centrocampista6)
		@c7=@socce.find(@rose.centrocampista7)
		@c8=@socce.find(@rose.centrocampista8)
		@a1=@socce.find(@rose.attaccante1)
		@a2=@socce.find(@rose.attaccante2)
		@a3=@socce.find(@rose.attaccante3)
		@a4=@socce.find(@rose.attaccante4)
		@a5=@socce.find(@rose.attaccante5)
		@a6=@socce.find(@rose.attaccante6)
		@i=@p1.quotazione+@p3.quotazione+@p2.quotazione+@a2.quotazione+@a3.quotazione+@a4.quotazione+@a5.quotazione+@a6.quotazione+@a1.quotazione+@d1.quotazione+@d2.quotazione+@d3.quotazione+@d4.quotazione+@d5.quotazione+@d6.quotazione+@d7.quotazione+@c1.quotazione+@c2.quotazione+@c3.quotazione+@c4.quotazione+@c5.quotazione+@c6.quotazione+@c7.quotazione+@c8.quotazione

		if @p1.ruolo!="portiere"||@p2.ruolo!="portiere"||@p3.ruolo!="portiere"||@a1.ruolo!="attaccante"||@a2.ruolo!="attaccante"||@a3.ruolo!="attaccante"||@a4.ruolo!="attaccante"||@a5.ruolo!="attaccante"||@a6.ruolo!="attaccante"||@c1.ruolo!="centrocampista"||@c2.ruolo!="centrocampista"||@c3.ruolo!="centrocampista"||@c4.ruolo!="centrocampista"||@c5.ruolo!="centrocampista"||@c6.ruolo!="centrocampista"||@c7.ruolo!="centrocampista"||@c8.ruolo!="centrocampista"||@d1.ruolo!="difensore"||@d2.ruolo!="difensore"||@d3.ruolo!="difensore"||@d4.ruolo!="difensore"||@d5.ruolo!="difensore"||@d6.ruolo!="difensore"||@d7.ruolo!="difensore"||current_user.budget-@i<0
       params[:id]=current_user.id
       destroy
end
if(@rose.portiere1==@rose.portiere2)||(@rose.portiere1==@rose.portiere3)|| (@rose.portiere2==@rose.portiere3)||(@rose.difensore1==@rose.difensore2)||(@rose.difensore1==@rose.difensore3)||(@rose.difensore1==@rose.difensore4)||(@rose.difensore1==@rose.difensore5)||(@rose.difensore1==@rose.difensore6)||(@rose.difensore1==@rose.difensore7)||(@rose.difensore2==@rose.difensore3)||(@rose.difensore2==@rose.difensore4)||(@rose.difensore2==@rose.difensore5)||(@rose.difensore2==@rose.difensore6)||(@rose.difensore2==@rose.difensore7)||(@rose.difensore3==@rose.difensore4)||(@rose.difensore3==@rose.difensore5)||(@rose.difensore3==@rose.difensore6)||(@rose.difensore3==@rose.difensore7)||(@rose.difensore4==@rose.difensore5)||(@rose.difensore4==@rose.difensore6)||(@rose.difensore4==@rose.difensore7)||(@rose.difensore5==@rose.difensore6)||  (@rose.difensore5==@rose.difensore7)||(@rose.difensore6==@rose.difensore7)||(@rose.centrocampista1==@rose.centrocampista2)||(@rose.centrocampista1==@rose.centrocampista3)||(@rose.centrocampista1==@rose.centrocampista4)||(@rose.centrocampista1==@rose.centrocampista5)||(@rose.centrocampista1==@rose.centrocampista6)||(@rose.centrocampista1==@rose.centrocampista7)||(@rose.centrocampista1==@rose.centrocampista8)||(@rose.centrocampista2==@rose.centrocampista3)||(@rose.centrocampista2==@rose.centrocampista4)||(@rose.centrocampista2==@rose.centrocampista5)||(@rose.centrocampista2==@rose.centrocampista6)||(@rose.centrocampista2==@rose.centrocampista7)||(@rose.centrocampista2==@rose.centrocampista8)||(@rose.centrocampista3==@rose.centrocampista4)||(@rose.centrocampista3==@rose.centrocampista5)||(@rose.centrocampista3==@rose.centrocampista6)||(@rose.centrocampista3==@rose.centrocampista7)||(@rose.centrocampista3==@rose.centrocampista8)||(@rose.centrocampista4==@rose.centrocampista5)||(@rose.centrocampista4==@rose.centrocampista6)||(@rose.centrocampista4==@rose.centrocampista7)||(@rose.centrocampista4==@rose.centrocampista8)||(@rose.centrocampista5==@rose.centrocampista6)||(@rose.centrocampista5==@rose.centrocampista7)||(@rose.centrocampista5==@rose.centrocampista8)||(@rose.centrocampista6==@rose.centrocampista7)||(@rose.centrocampista6==@rose.centrocampista8)||(@rose.centrocampista7==@rose.centrocampista8)||(@rose.attaccante1==@rose.attaccante2)||(@rose.attaccante1==@rose.attaccante3)||(@rose.attaccante1==@rose.attaccante4)||(@rose.attaccante1==@rose.attaccante5)||(@rose.attaccante1==@rose.attaccante6)||(@rose.attaccante2==@rose.attaccante3)||(@rose.attaccante2==@rose.attaccante4)||(@rose.attaccante2==@rose.attaccante5)||(@rose.attaccante2==@rose.attaccante6)||(@rose.attaccante3==@rose.attaccante4)||(@rose.attaccante3==@rose.attaccante5)||(@rose.attaccante3==@rose.attaccante6)||(@rose.attaccante4==@rose.attaccante5)||(@rose.attaccante4==@rose.attaccante6)||(@rose.attaccante5==@rose.attaccante6)

params[:id]=current_user.id
destroy
end

end


	end

	def new
      if( !@rosa = current_user.rose)
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
          if @rosa.inseriti == 24
              current_user.update_attributes(:budget => current_user.budget - player.quotazione)
              redirect_to leagues_path
          else
              current_user.update_attributes(:budget => current_user.budget - player.quotazione)
              redirect_to '/roses/new/'+ player.ruolo.to_s
          end
      else
        flash[:danger] = "ATTENZIONE!!! Budget insufficiente"
        return
      end
    end
	def create

	end
	def update

	end
    def delete_d
        redirect_to rose_path(@rose.user_id)
    end

	def destroy
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
