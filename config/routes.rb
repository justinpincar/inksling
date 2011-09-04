Inksling::Application.routes.draw do
  resources :inks
  resources :users

  root :to => "home#index"
end
