Rails.application.routes.draw do

    resources :admins

    devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks", registrations: 'users/registrations' }

    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :homes
    resources :leagues
    root :to => redirect('/users/sign_in')
    get 'about'   => 'static_pages#about'
    get 'contact' => 'static_pages#contact'
end
