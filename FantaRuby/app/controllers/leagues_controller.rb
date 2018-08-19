class LeaguesController < ApplicationController
    before_action :authenticate_user!
    require 'net/http'


    def new_event


        title=params.fetch(:match1).fetch(:title)
        anno=params.fetch(:match).fetch(:"data(1i)")
        mese=params.fetch(:match).fetch(:"data(2i)")
        giorno=params.fetch(:match).fetch(:"data(3i)")
        ora=params.fetch(:match).fetch(:"data(4i)")
        minuti=params.fetch(:match).fetch(:"data(5i)")

        if giorno.size<2
            giorno="0"+giorno
        end
        if mese.size<2
            mese="0"+mese
        end
        h=anno+mese+giorno+ora+minuti
        g=h.to_datetime
        k=g.to_s

        client = Signet::OAuth2::Client.new(client_options)
        client.update!(session[:authorization])
        service = Google::Apis::CalendarV3::CalendarService.new

        service.authorization = client
        start=DateTime.new(anno.to_i,mese.to_i,giorno.to_i,ora.to_i-2,minuti.to_i,0)
        ende=DateTime.new(anno.to_i,mese.to_i,giorno.to_i,ora.to_i-2,minuti.to_i,0)
        event = Google::Apis::CalendarV3::Event.new(
            summary: title,

            start:  { date_time: start.to_datetime },
            end:    { date_time: ende.to_datetime }
        )
        service.insert_event(params[:calendar_id], event)
        redirect_to admin_path(params[:calendar_id])

    end

    def index
#        require 'unirest'
#        @response = Unirest.get "https://api-football-v1.p.mashape.com/fixtures/league/28",         #28 è l'id corrispondente alla Serie A
#            headers:{
#              "X-Mashape-Key" => "gbTXi7A4LSmsh5ViprmXBGWmESpdp1XQfzZjsn2h4H1iyTzpS3",
#              "Accept" => "application/json"
#            }
#        all_matches = @response.body["api"]["fixtures"]                                             #tutti i match di tutta la Serie A
                                                                                                    #gli id partono da 9045 e arrivano 8666 (infatti sono 380 partite)
                                                                                                    #ogni 10 numeri è una giornata completa

#        @richieste_rimanenti = @response.headers[:x_ratelimit_requests_remaining] + "/" + @response.headers[:x_ratelimit_requests_limit]
#        @uid=current_user.id
        authorize! :index, League, :message => "Non fai ancora parte di una lega"
        id = current_user.league_id
        @lega = League.find(id)
        current_day = @lega.current_day
#        @days_matches = []
#        for i in (0..9)
#            if(current_day == 1)
#                @days_matches[i] = all_matches[(9045 - (10 - i)).to_s]
#            else
#                @days_matches[i] = all_matches[(9045 - ((current_day - 1)*10 - i)).to_s]
#            end
#        end
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
        nameLeague=params.fetch(:league).fetch(:name)
        if nameLeague == ""
            flash[:notice] = "Campo nome lega vuoto!"
            redirect_to new_league_path and return

        end
        if params.fetch(:league).fetch(:description) == ""
            flash[:notice] = "Campo info lega vuoto!"
            redirect_to new_league_path and return
        end
        leag=League.all
        leag.each do |l|
            if nameLeague == l.name
                flash[:notice] = "La lega esiste gia con questo nome!"
                redirect_to new_league_path and return
            end
        end

        @user = current_user
        @league = League.new(params[:league].permit(:name, :players, :status, :description, :user, :current_day, :votes_day))
        @league.president_id = @user.id
        @league.status = "Aperta"
        @league.players = params[:league][:players]
        @user.update_attributes!(:league_id => @league.id)
        #se crei una lega a campionato iniziato la giornata sarà settata alla
        #alla giornata corrente del campionato

        if(League.first)
            if(giornataCorrente = League.first.votes_day)
                @league.current_day = giornataCorrente
                @league.votes_day = giornataCorrente
            end
        end
        if current_user.roles_mask == 1                                         #notdefined
            if @league.save!
                 flash[:notice] = "#{@league.name} was successfully created."
                 current_user.update_attributes!(:league_id => @league.id)
            else
                render new_league_path
            end
        end
		redirect_to new_rose_path + '/portiere'
	end

    def edit
        authorize! :edit, League, :message => "Non puoi modificare le impostazioni della lega"
        lid=params[:id]
        @lega=League.find(lid)
        @users=User.where("league_id = ? and league_id != ?",lid,8)
    end

     def update
        authorize! :update, League, :message => "Non puoi modificare le impostazioni della lega"
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
            redirect_to admins_path + '/delete/users'
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
        @lega.update_attributes!(:status => params[:radio])
        ##
        #gestione descrizione lega
        @lega.update_attributes!(params[:league].permit(:description))
         ##
    end

    #@stringaBonus/Malus servono per far riapparire i bonus/malus precedentemente
    #messi nella tabella, se no ritornerebbero a 0
    def rate_score
      authorize! :rate_score, League, :message => "Non sei autorizzato a calcolare i voti"
      @league = League.find(current_user.league_id)
      @currentDay = @league.current_day
      @allLeagueUsers = @league.users
      @stringaBonus = ""
      @stringaMalus = ""

      @allLeagueUsers.each do |user|
          f = user.formazionis.find_by_giornata(@currentDay)
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
          #controllo sela giornata corrente della lega è la stesadei voti nel databese
          #nel caso in cui la giornata della lega sia minore della giornata dei voti
          #tutti i votiverranno settati a 0 senza l'aggiunta di bonuso malus
          if( @currentDay < @league.votes_day )
							f.punteggio = 0
							f.save
							flash[:danger] = "Attenzione: poichè la giornata corrente è precedente alle votazioni, i punteggi verranno settati a 0"
					else
							#prima dell'aggiunta del votes_day c'era solo questo
							f.punteggio = players_daily_score(user.id, @currentDay)
							f.save
					end


      end
      @stringaBonus = @stringaBonus.split(",")
      @stringaMalus = @stringaMalus.split(",")
    end


    #funzione per avanzare di giornata
    def go_next
        authorize! :go_next, League, :message => "Non puoi modificare le impostazioni della lega"
        lega = League.find(current_user.league_id)
        #controllo solo per evitare il doppio click su go next day, controlla
        #che la differenza il giorno tra successivo e il giorno dell'ultima formazione
        #creata dagli utenti non sia maggiore di uno
        if( lega.current_day <= lega.votes_day )
						lega.current_day += 1
            lega.save
            redirect_to '/leagues/score/rate'
        else
            flash[:danger] = "Attenzione: non puoi calcolare i punteggi della giornata corrente se i voti non sono  della medesima giornata"
            redirect_to '/leagues/score/rate'
        end
    end
		#funzione per il  calendar degli utenti
		#viene richiamata dopo il log in di google
		def callback

				client = Signet::OAuth2::Client.new(client_options)
				client.code = params[:code]

				response = client.fetch_access_token!

				session[:authorization] = response
				redirect_to '/leagues/calendar/events/federicobucci504@gmail.com'
		end
		#funzione per il  calendar degli utenti
		#va sulla pagina eventi e li visualizza
		def events
				client = Signet::OAuth2::Client.new(client_options)
				client.update!(session[:authorization])

				service = Google::Apis::CalendarV3::CalendarService.new
				service.authorization = client
				#controllo se non ho mai loggato con google
				if(!session[:authorization])
					client = Signet::OAuth2::Client.new(client_options)
					redirect_to client.authorization_uri.to_s
				else
					#controllo se il token è scaduto
					response = Net::HTTP.get(URI.parse('https://www.googleapis.com/oauth2/v1/tokeninfo?access_token='+(session[:authorization].first[1])))
					if(response.split[2][1,13] == "invalid_token")
						client =●●●●●● Signet::OAuth2::Client.new(client_options)
						redirect_to client.authorization_uri.to_s
					else
						@event_list = service.list_events(params[:calendar_id])
					end
				end
		end

		def authenticate_google_OAuthtoken(token)
			url = URI.parse('https://www.googleapis.com/oauth2/v1/tokeninfo?access_token='+token)
			req = Net::HTTP::Get.new(url.to_s)
			res = Net::HTTP.start(url.host, url.port) {|http| http.request(req)}
			prova = res.body
			debugger
			#if(isset(response->issued_to))
			#		return true
			#elsif(isset(response->error))
			#		return false
			#end
    end

    private

    def players_daily_score(id, day)
        #calcolo totale punteggio giocatori in formazione
        punteggio = 0
        formazione = Formazioni.where( user_id: id, giornata: day).first
        if(formazione.portiere)
            sp 	= SoccersPlayer.find(formazione.portiere).daily_score
        else
            sp = 0
        end
        if(formazione.difensore1)
            sd1 = SoccersPlayer.find(formazione.difensore1).daily_score
        else
            sd1 = 0
        end
        if(formazione.difensore2)
            sd2 = SoccersPlayer.find(formazione.difensore2).daily_score
        else
            sd2 = 0
        end
        if(formazione.difensore3)
            sd3 = SoccersPlayer.find(formazione.difensore3).daily_score
        else
            sd3 = 0
        end
        if(formazione.centrocampista1)
            sc1 = SoccersPlayer.find(formazione.centrocampista1).daily_score
        else
            sc1 = 0
        end
        if(formazione.centrocampista2)
            sc2 = SoccersPlayer.find(formazione.centrocampista2).daily_score
        else
            sc2 = 0
        end
        if(formazione.centrocampista3)
            sc3 = SoccersPlayer.find(formazione.centrocampista3).daily_score
        else
            sc3 = 0
        end
        if(formazione.centrocampista4)
            sc4 = SoccersPlayer.find(formazione.centrocampista4).daily_score
        else
            sc4 = 0
        end
        if(formazione.attaccante1)
            sa1 = SoccersPlayer.find(formazione.attaccante1).daily_score
        else
            sa1 = 0
        end
        if(formazione.attaccante2)
            sa2 = SoccersPlayer.find(formazione.attaccante2).daily_score
        else
            sa2 = 0
        end
        if(formazione.attaccante3)
            sa3 = SoccersPlayer.find(formazione.attaccante3).daily_score
        else
            sa3 = 0
        end
        punteggio = sp+sd1+sd2+sd3+sc1+sc2+sc3+sc4+sa1+sa2+sa3
        #aggiunta punteggio riserva se un giocatore in formaione non ha giocato
        if( sp == 0 )
            if(formazione.riservapor)
                punteggio += SoccersPlayer.find(formazione.riservapor).daily_score
            end
        end
        if( sd1 == 0 || sd2 == 0 || sd3 == 0 )
            if(formazione.riservadif)
                punteggio += SoccersPlayer.find(formazione.riservadif).daily_score
            end
        end
        if( sc1 == 0 || sc2 == 0 || sc3 == 0 || sc4 == 0 )
            if(formazione.riservacen)
                punteggio += SoccersPlayer.find(formazione.riservacen).daily_score
            end
        end
        if( sa1 == 0 || sa2 == 0 || sa3 == 0 )
            if(formazione.riservaatt)
                punteggio += SoccersPlayer.find(formazione.riservaatt).daily_score
            end
        end
        #aggiunta bonus o malus
        if params["b"+id.to_s]
            punteggio += params["b"+id.to_s].to_i
            punteggio -= params["m"+id.to_s].to_i
        end
        punteggio
    end


    def save_rose

    end


    #funzione per il  calendar degli utenti
    #crea le credenziali per google
    def client_options
        {
            client_id: Rails.application.secrets.google_client_id,
            client_secret: Rails.application.secrets.google_client_secret,
            authorization_uri: 'https://accounts.google.com/o/oauth2/auth',
            token_credential_uri: 'https://accounts.google.com/o/oauth2/token',
            scope: Google::Apis::CalendarV3::AUTH_CALENDAR,
            redirect_uri: callback_url
        }
    end

end
