Inksling::Application.routes.draw do
  devise_for :users do
    match '/home/authenticate' => "devise/registrations#new", :as => :authenticate
    match '/users/sign_out' => "devise/sessions#destroy", :as => :sign_out
  end

  resources :dashboard, :only => [:index]
  resources :inks
  resources :users

  root :to => "home#index"
end
