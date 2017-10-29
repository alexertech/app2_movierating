Rails.application.routes.draw do

  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  get  "/login"  => "sessions#new"     , as: :login
  post "/login"  => "sessions#create"
  get  "/logout" => "sessions#destroy" , as: :logout

  resources :users
  resources :movies
  root "movies#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
