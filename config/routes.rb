Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show, :edit, :update] do
    collection do
      get 'search'
    end
  end
  
  resources :trainings, only: [:index, :new, :create]
  root "trainings#index"

  put 'users/follow/:user_id',to: 'users#follow'
  put 'users/unfollow/:user_id',to: 'users#unfollow'
  get 'users/follow_list/:user_id',to: 'users#follow_list'
  get 'users/follower_list/:user_id',to:'users#follower_list'
  # フォロー・フォロワーの一覧ページ
end
