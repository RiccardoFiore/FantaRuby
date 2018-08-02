class FormazionisController < ApplicationController
 
  def new	
		lega = League.find(current_user.league_id)
		rosa = current_user.rose
		#creazione array con tutti i giocatori della rosa, poiche nella rosa ho solo
		#gli id devo cercarli e qui è il collo di bottiglia
		@rose = []
		@rose[0] = SoccersPlayer.find(rosa.portiere1)
		@rose[1] = SoccersPlayer.find(rosa.portiere2)
		@rose[2] = SoccersPlayer.find(rosa.portiere3)
		@rose[3] = SoccersPlayer.find(rosa.difensore1)
		@rose[4] = SoccersPlayer.find(rosa.difensore2)
		@rose[5] = SoccersPlayer.find(rosa.difensore3)
		@rose[6] = SoccersPlayer.find(rosa.difensore4)
		@rose[7] = SoccersPlayer.find(rosa.difensore5)
		@rose[8] = SoccersPlayer.find(rosa.difensore6)
		@rose[9] = SoccersPlayer.find(rosa.difensore7)
		@rose[10] = SoccersPlayer.find(rosa.centrocampista1)
		@rose[11] = SoccersPlayer.find(rosa.centrocampista2)
		@rose[12] = SoccersPlayer.find(rosa.centrocampista3)
		@rose[13] = SoccersPlayer.find(rosa.centrocampista4)
		@rose[14] = SoccersPlayer.find(rosa.centrocampista5)
		@rose[15] = SoccersPlayer.find(rosa.centrocampista6)
		@rose[16] = SoccersPlayer.find(rosa.centrocampista7)
		@rose[17] = SoccersPlayer.find(rosa.centrocampista8)
		@rose[18] = SoccersPlayer.find(rosa.attaccante1)
		@rose[19] = SoccersPlayer.find(rosa.attaccante2)
		@rose[20] = SoccersPlayer.find(rosa.attaccante3)
		@rose[21] = SoccersPlayer.find(rosa.attaccante4)
		@rose[22] = SoccersPlayer.find(rosa.attaccante5)
		@rose[23] = SoccersPlayer.find(rosa.attaccante6)
		@currentDay = lega.current_day
		#controllo se la formazioneè gia esistente oppure è laprimavolta che la si crea
		if( !@formazione = current_user.formazionis.find_by_giornata(@currentDay) )
			@formazione = Formazioni.new( user_id: current_user.id, giornata: @currentDay)
			@formazione.save
		end
		#creao array con tutti gli id dei giocatori già messi in formazione
		@b = []
		@b[0] =	@formazione.portiere
	  @b[1] = @formazione.difensore1
	  @b[2] = @formazione.difensore2
	  @b[3] = @formazione.difensore3
	  @b[4] = @formazione.centrocampista1
	  @b[5] = @formazione.centrocampista2
	  @b[6] = @formazione.centrocampista3
	  @b[7] = @formazione.centrocampista4
	  @b[8] = @formazione.attaccante1
	  @b[9] = @formazione.attaccante2
	  @b[10] = @formazione.attaccante3
	  @b[11] = @formazione.riservapor
	  @b[12] = @formazione.riservadif
	  @b[13] = @formazione.riservacen
	  @b[14] = @formazione.riservaatt
		#controllo se arrivo alla new per laprimavoltaoppure è il refresh per l'inserimento
		#del giocatore
		if(!params[:id]) 
			return
		end
		#cerco nell'array sopra crato il giocatore che devo inserire e che mi è stato
		#passato come params[:id]
		for i in (0..23)
			if(@rose[i].id == params[:id].to_i)
				player = @rose[i]
			end
		end
		#controlli sul giocatore da inserire: ruolo, posizione 
		#con successivo inserimento(salvataggio nel db)
		#cotrollo per portiere
		if(player.ruolo == "portiere")
			if(@formazione.portiere == nil)
				@formazione.portiere = player.id
			elsif(@formazione.riservapor == nil)
				@formazione.riservapor = player.id
			else
				flash[:danger] = "ATTENZIONE!!! hai già inserito  tutti i portieri"
				redirect_to '/formazionis/new'
			end
			@formazione.save
		end
		#cotrollo per difensore
		if(player.ruolo == "difensore")
			if(@formazione.difensore1 == nil)
				@formazione.difensore1 = player.id
			elsif(@formazione.difensore2 == nil)
				@formazione.difensore2 = player.id
			elsif(@formazione.difensore3 == nil)
				@formazione.difensore3 = player.id
			elsif(@formazione.riservadif == nil)
				@formazione.riservadif = player.id
			else
				flash[:danger] = "ATTENZIONE!!! hai già inserito  tutti i difensori"	
			end
			@formazione.save
			redirect_to '/formazionis/new'
		end
		#cotrollo per centrocampista
		if(player.ruolo == "centrocampista")
			if(@formazione.centrocampista1 == nil)
				@formazione.centrocampista1 = player.id
			elsif(@formazione.centrocampista2 == nil)
				@formazione.centrocampista2 = player.id
			elsif(@formazione.centrocampista3 == nil)
				@formazione.centrocampista3 = player.id
			elsif(@formazione.centrocampista4 == nil)
				@formazione.centrocampista4 = player.id
			elsif(@formazione.riservacen == nil)
				@formazione.riservacen = player.id
			else
				flash[:danger] = "ATTENZIONE!!! hai già inserito  tutti i centrocampisti"
			end
			@formazione.save
			redirect_to '/formazionis/new'
		end
		#cotrollo per attaccante
		if(player.ruolo == "attaccante")
			if(@formazione.attaccante1 == nil)
				@formazione.attaccante1 = player.id
			elsif(@formazione.attaccante2 == nil)
				@formazione.attaccante2 = player.id
			elsif(@formazione.attaccante3 == nil)
				@formazione.attaccante3 = player.id
			elsif(@formazione.riservaatt == nil)
				@formazione.riservaatt = player.id
			else
				flash[:danger] = "ATTENZIONE!!! hai già inserito  tutti gli attaccanti"
			end
			@formazione.save
			redirect_to '/formazionis/new'
		end

  end

	def destroy
		giornata = League.find(current_user.league_id).current_day
		formazione = current_user.formazionis.find_by_giornata(giornata)
		a = []
		b = []
		a[0] = "portiere"
		a[1] = "difensore1"
		a[2] = "difensore2"
		a[3] = "difensore3"
		a[4] = "centrocampista1"
		a[5] = "centrocampista2"
		a[6] = "centrocampista3"
		a[7] = "centrocampista4"
		a[8] = "attaccante1"
		a[9] = "attaccante2"
		a[10] = "attaccante3"
		a[11] = "riservapor"
		a[12] = "riservadif"
		a[13] = "riservacen"
		a[14] = "riservaatt"
		b[0] =	formazione.portiere
	  b[1] = formazione.difensore1
	  b[2] = formazione.difensore2
	  b[3] = formazione.difensore3
	  b[4] = formazione.centrocampista1
	  b[5] = formazione.centrocampista2
	  b[6] = formazione.centrocampista3
	  b[7] = formazione.centrocampista4
	  b[8] = formazione.attaccante1
	  b[9] = formazione.attaccante2
	  b[10] = formazione.attaccante3
	  b[11] = formazione.riservapor
	  b[12] = formazione.riservadif
	  b[13] = formazione.riservacen
	  b[14] = formazione.riservaatt
	  for i in (0..14)
			if(b[i]==params[:id].to_i)
				formazione[a[i]]  = nil
			end
	  end
	  formazione.save
	  redirect_to '/formazionis/new'
	end
end
