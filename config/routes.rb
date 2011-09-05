Inksling::Application.routes.draw do
  devise_for :authors do
    match '/home/authenticate' => "devise/registrations#new", :as => :authenticate
    match '/sign_out' => "devise/sessions#destroy", :as => :sign_out
  end

  resources :authors, :only => [:show, :edit, :update] do
    member do
      post :follow
      post :unfollow
    end
  end

  resources :comments, :only => [:create, :destroy]
  resources :dashboard, :only => [:index]
  resources :inks

  root :to => "home#index"
end
