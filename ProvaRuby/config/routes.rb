Rails.application.routes.draw do

    resources :admins

  get 'users/new'
    devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks", registrations: 'users/registrations' }

    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :homes
    resources :leagues
    resource :users
    root :to => redirect('/users/sign_in')
    get 'about'   => 'static_pages#about'
    get 'contact' => 'static_pages#contact'
    get 'error' => 'errore_permessi#error'

    #routes per la gestione dei playersda partedell'admin
    match '/users/:id/delete', :to => 'users#destroy', :as => :destroy_user, :via => :delete
		get '/users/:id' => 'users#show_by_id'

end
