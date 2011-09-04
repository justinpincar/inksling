Inksling::Application.routes.draw do
  devise_for :authors do
    match '/home/authenticate' => "devise/registrations#new", :as => :authenticate
    match '/sign_out' => "devise/sessions#destroy", :as => :sign_out
  end

  resources :dashboard, :only => [:index]
  resources :inks
  resources :authors

  root :to => "home#index"
end
