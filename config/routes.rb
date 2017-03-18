Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'users#index' # <---- change this

  resources :users, only: [:new, :create] do
    resources :favourites, only: [:create, :destory]
  end
  # leaderboard could use user#index
  # the profile link on the wireframe could direct to user#show
  resources :sessions, only: [:new, :create, :destroy]

  resources :drill_groups
end
