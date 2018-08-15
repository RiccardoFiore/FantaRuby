Rails.application.routes.draw do

    get 'formazionis/new'
    devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks", registrations: 'users/registrations' }

    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :admins
    resources :homes
    resources :leagues
    resources :users
    resources :roses
    resources :formazionis
    resources :soccers_players do
        collection { post :import,:import_score}
    end
    resources :soccer_infos
    root :to => redirect('/users/sign_in')
    get 'about'   => 'static_pages#about'
    get 'contact' => 'static_pages#contact'
    get 'error' => 'errore_permessi#error'

    get 'ranking' => 'users#ranking'
    get 'daily_ranking' => 'users#daily_ranking'

    #routes per la gestione dei playersda partedell'admin
    match '/users/:id/delete', :to => 'users#destroy', :as => :destroy_user, :via => :delete
    post '/users/:id' => 'users#tweet'

    #routes per il calcolo dei daily score
    get '/leagues/score/rate' => 'leagues#rate_score'
    post '/leagues/score/rate' => 'leagues#rate_score'
    get '/leagues/go/next' => 'leagues#go_next'

    #routes per l'inserimento dei giocatori in formazione
    get '/formazionis/new/:id' => 'formazionis#new'
    #routes per l'inserimento dei giocatori in rosa
    get '/roses/new/:id/ruolo/:ruolo' => 'roses#new'
    get '/roses/new/:ruolo' => 'roses#new'

    get '/admins/delete/users' => 'admins#delete_users'
    post '/admins/delete/users' => 'admins#delete_users'

    #routes per la visualizzazioni di tutte le formazioni
    get '/formazionis/day/:id' => 'formazionis#index'

    #routes per il google calendar degli utenti


    get '/leagues/calendar/callback', to: 'leagues#callback', as: 'callback'
    get '/leagues/calendar/events/:calendar_id', to: 'leagues#events', as: 'events', calendar_id: /[^\/]+/
    post "/leagues/calendar/new_event/:calendar_id", to: "leagues#new_event", as: "new_event", calendar_id: /[^\/]+/

end
