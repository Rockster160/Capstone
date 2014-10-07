Rails.application.routes.draw do

  # devise_for :users, controllers: { registrations: 'registrations' }, :path_prefix => 'd'
  devise_for :users
  devise_scope :user do
    root to: 'devise/sessions#new'
    # get "user/registrations/read", to: 'registrations#read', as: 'usersprofile'
  end
  resources :users, only: [:show]

  get 'index/contact'

  get 'games/create'

  get 'games/create', as: 'creategames'
  get 'games/read'
  get 'games/update'
  get 'games/destroy'

  get 'games/bowling'
  get 'games/rpg'
  get 'games/hoops'
  get 'games/pacman'
  get 'games/platformer'
  get 'games/pusoy'
  get 'games/play/rpg'
  get 'games/play/hoops'
  get 'games/play/pacman'
  get 'games/play/platformer'
  get 'games/play/pusoy'
  get 'games/play/bowling'

  get '/search' => 'search_results#index'
end
