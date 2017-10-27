Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "movies#index"

  resources :users
  resources :movies

  # Session maagement
  get  "/login"  => "sessions#new"     , as: :login
  post "/login"  => "sessions#create"
  get  "/logout" => "sessions#destroy" , as: :logout

end
