Inksling::Application.routes.draw do
  devise_for :authors,
             :controllers => {
                 :sessions => "authors/sessions",
                 :sessions => "authors/sessions"
             } do
    match '/home/authenticate' => "authors/sessions#new", :as => :authenticate
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
    member do
      post :tag
      post :untag
    end

    collection do
      get :random
    end
  end
  match '/inks/tagged/:text' => 'inks#tagged', :as => :tagged_inks

  match '/about' => 'home#about', :as => :about
  match '/jobs' => 'home#jobs', :as => :jobs
  match '/press' => 'home#press', :as => :press
  match '/privacy' => 'home#privacy', :as => :privacy
  match '/team' => 'home#team', :as => :team
  match '/terms' => 'home#terms', :as => :terms
  root :to => "home#index"
end
