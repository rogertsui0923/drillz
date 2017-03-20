Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'users#index' # <---- change this

  resources :passwords_resets, only: [:new, :create, :edit, :update]

  resources :favourites, only: [:create, :destroy]

  resources :users, only: [:new, :create, :edit, :update, :show,] do
    get '/profile' => 'users#profile'
    put :password
  end


  # leaderboard could use user#index
  # the profile link on the wireframe could direct to user#show
  resources :sessions, only: [:new, :create, :destroy]

  resources :drill_groups, shallow: true do
    resources :drills, only: [:create, :update, :destroy, :edit, :show] do
      resources :solutions#, only: [
      resources :attempts
    end
  end


end
