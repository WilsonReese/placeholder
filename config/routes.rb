Rails.application.routes.draw do
  root "reservations#index"

  devise_for :users

  resources :theaters
  resources :reservations

end
