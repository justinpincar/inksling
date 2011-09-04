Inksling::Application.routes.draw do
  resources :inks
  resources :users

  resources :home, :only => [:index] do
    collection do
      get :authenticate
    end
  end

  root :to => "home#index"
end
