Rails.application.routes.draw do

  get 'activities/index'

  # devise_for :users, controllers: { registrations: 'registrations' }, :path_prefix => 'd'
  devise_for :users
  devise_scope :user do
    root to: 'devise/sessions#new'
    # get "user/registrations/read", to: 'registrations#read', as: 'usersprofile'
  end

  get 'games/read'
  resources :users, :games, only: [:show]

  get 'users/update/:id' => 'users#update'
  get 'games/:id' => 'games#show'
  get 'index/contact'

  # get 'games/play/rpg'
  # get 'games/play/hoops'
  # get 'games/play/pacman'
  # get 'games/play/platformer'
  # get 'games/play/pusoy'
  # get 'games/play/bowling'

  get '/search' => 'search_results#index'
end
