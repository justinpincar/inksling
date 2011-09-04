Inksling::Application.routes.draw do
  devise_for :users

  resources :inks
  resources :users

  root :to => "home#index"
end
