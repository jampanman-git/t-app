Rails.application.routes.draw do
  devise_for :users
  
  resources :trainings, only: [:index, :new, :create]
  root "trainings#index"
end
