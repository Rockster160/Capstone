Rails.application.routes.draw do


  post 'users/getscores' => 'users#getscores'
  # devise_for :users, controllers: { registrations: 'registrations' }, :path_prefix => 'd'
  devise_for :users

  devise_for :admins
  get 'index/contact'

  devise_for :users, controllers: { registrations: 'user/registrations' }, :path_prefix => 'd'
  resources :users, :only => [:show]


  get 'index/contact'

  root 'users#show'

  get 'games/create'


  # devise_for :users, controllers: { registrations: 'user/registrations' }
  devise_scope :user do
    root to: 'devise/sessions#new'
    # get "user/registrations/read", to: 'registrations#read', as: 'usersprofile'
  end

  get 'activities/index'
  # resources :activites
  get 'games/read'
  resources :users, :games, :play, only: [:show]

  get 'games/play/mazegame' => 'games#mazegame', as: 'mazegame'

  get 'users/edit' => 'users#edit', as: 'edit'
  post 'users/:id/update' => 'users#update', as: 'update'
  get 'games/:id' => 'games#show'
  get 'games/:id/info' => 'games#info', as: 'game_info'
  get 'games/:id/editpopup' => 'games#edit', as: 'game_edit'
  get 'index/contact', as: 'contact'

  # get 'games/play/rpg'
  # get 'games/play/hoops'
  # get 'games/play/pacman'
  # get 'games/play/platformer'
  # get 'games/play/pusoy'
  # get 'games/play/bowling'

  get '/search' => 'search_results#index'
end
