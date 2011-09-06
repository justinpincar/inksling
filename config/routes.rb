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

  resources :inks do
    collection do
      get :random
    end
  end

  match '/about' => 'home#about', :as => :about
  match '/jobs' => 'home#jobs', :as => :jobs
  match '/press' => 'home#press', :as => :press
  match '/privacy' => 'home#privacy', :as => :privacy
  match '/team' => 'home#team', :as => :team
  match '/terms' => 'home#terms', :as => :terms
  root :to => "home#index"
end
