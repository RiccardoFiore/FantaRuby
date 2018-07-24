Rails.application.routes.draw do



  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :homes
    root :to => redirect('/homes')
    get 'about'   => 'static_pages#about'
    get 'contact' => 'static_pages#contact'
end
