Rails.application.routes.draw do
  devise_for :users
  resources :trainings, only: [:index]
  root "trainings#index"
end
