class LeaguesController < ApplicationController
    before_action :authenticate_user!

    def index
        @uid=current_user.id
        authorize! :index, League, :message => "Non fai ancora parte di una lega"
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
        ##
        #gestione descrizione lega
        @lega.update_attributes!(params[:league].permit(:description))
         ##
    end

		#@stringaBonus/Malus servono per far riapparire i bonus/malus precedentemente
		#messi nella tabella, se no ritornerebbero a 0
		def rate_score

			@currentDay = League.find(current_user.league_id).current_day
			league = current_user.league_id
			@allLeagueUsers = User.where(league_id: league)
			@stringaBonus = ""
			@stringaMalus = ""

			@allLeagueUsers.each do |user|
				f = Formazioni.where( player_id: user.id, giornata: @currentDay).first
				if params["b"+user.id.to_s]
					@stringaBonus += params["b"+user.id.to_s]
					@stringaMalus += params["m"+user.id.to_s]
				else
					@stringaBonus += "0"
					@stringaMalus += "0"
				end
				@stringaBonus += ","
				@stringaMalus += ","
				#controllo presenzaformazione, in caso contrario
				if !f
					next
				end
				f.punteggio = players_daily_score(user.id, @currentDay)
				f.save

			end
			@stringaBonus = @stringaBonus.split(",")
			@stringaMalus = @stringaMalus.split(",")
		end


		#funzione per avanzare di giornata
		def go_next
			lega = League.find(current_user.league_id)
			#controllo solo per evitare il doppio click su go next day, controlla
			#che la differenza tra il giorno successivo e il giorno dell'ultima formazione
			#creata dagli utenti non sia maggiore di uno
			if( (lega.current_day + 1)-(Formazioni.last.giornata) > 1)
				flash[:danger] = "Warning u can't skip more than 2 days"
				redirect_to '/leagues/score/rate'
			else
				lega.current_day += 1
				lega.save
				redirect_to '/leagues/score/rate'
			end
		end

        private

		def players_daily_score(id, day)
			#calcolo totale punteggio giocatori in formazione
			punteggio = 0
			formazione = Formazioni.where( player_id: id, giornata: day).first
			sp 	= SoccersPlayer.find(formazione.portiere).daily_score
			sd1 = SoccersPlayer.find(formazione.difensore1).daily_score
			sd2 = SoccersPlayer.find(formazione.difensore2).daily_score
			sd3 = SoccersPlayer.find(formazione.difensore3).daily_score
			sc1 = SoccersPlayer.find(formazione.centrocampista1).daily_score
			sc2 = SoccersPlayer.find(formazione.centrocampista2).daily_score
			sc3 = SoccersPlayer.find(formazione.centrocampista3).daily_score
			sc4 = SoccersPlayer.find(formazione.centrocampista4).daily_score
			sa1 = SoccersPlayer.find(formazione.attaccante1).daily_score
			sa2 = SoccersPlayer.find(formazione.attaccante2).daily_score
			sa3 = SoccersPlayer.find(formazione.attaccante3).daily_score
			punteggio = sp+sd1+sd2+sd3+sc1+sc2+sc3+sc4+sa1+sa2+sa3
			#aggiunta punteggio riserva se un giocatore in formaione non ha giocato
			if( sp == 0 )
				punteggio += SoccersPlayer.find(formazione.riservapor).daily_score
			end
			if( sd1 == 0 || sd2 == 0 || sd3 == 0 )
				punteggio += SoccersPlayer.find(formazione.riservadif).daily_score
			end
			if( sc1 == 0 || sc2 == 0 || sc3 == 0 || sc4 == 0 )
				punteggio += SoccersPlayer.find(formazione.riservacen).daily_score
			end
			if( sa1 == 0 || sa2 == 0 || sa3 == 0 )
				punteggio += SoccersPlayer.find(formazione.riservaatt).daily_score
			end
			#aggiunta bonus o malus
			if params["b"+id.to_s]
				punteggio += params["b"+id.to_s].to_i
				punteggio -= params["m"+id.to_s].to_i
			end
			punteggio
		end



end
