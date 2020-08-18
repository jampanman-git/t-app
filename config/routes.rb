Rails.application.routes.draw do
  resources :trainings, only: [:index]
  root "trainings#index"
end
