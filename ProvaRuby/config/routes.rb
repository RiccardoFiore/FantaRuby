Rails.application.routes.draw do

    resources :admins

    devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks", registrations: 'users/registrations' }

    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :homes
    resources :leagues
    resources :users
    resources :soccers_players do
    collection { post :import }
    end
    root :to => redirect('/users/sign_in')
    get 'about'   => 'static_pages#about'
    get 'contact' => 'static_pages#contact'
    get 'error' => 'errore_permessi#error'

    #routes per la gestione dei playersda partedell'admin
    match '/users/:id/delete', :to => 'users#destroy', :as => :destroy_user, :via => :delete
		

		#routes per il calcolo dei daily score
		get '/leagues/score/rate' => 'leagues#rate_score'
		post '/leagues/score/rate' => 'leagues#rate_score'
		get '/leagues/go/next' => 'leagues#go_next'

end
