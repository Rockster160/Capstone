Rails.application.routes.draw do

  get 'trophies/checker'

  post 'users/getscores' => 'users#getscores'
  devise_for :users, controllers: { registrations: 'registrations' }
  # devise_for :users

  devise_scope :user do
    root to: 'devise/sessions#new'
    # get "user/registrations/read", to: 'registrations#read', as: 'usersprofile'
  end

  get 'activities/index'
  # resources :activites
  get 'games/read'
  get 'notifications/show' => 'notifications#show', as: 'notifications'
  resources :users, :games, only: [:show]

  get 'users/edit' => 'users#edit', as: 'edit'
  post 'users/:id/update' => 'users#update', as: 'update'
  post 'users/:id/shout' => 'users#shout', as: 'shout'
  get 'users/:id/read' => 'users#read'

  get 'games/:id' => 'games#show'
  get 'games/:id/info' => 'games#info', as: 'game_info'
  get 'games/:id/editpopup' => 'games#edit', as: 'game_edit'

  get 'index/contact', as: 'contact'

  get 'games/play/:id' => 'games#play', as: 'play'

  get '/search' => 'search_results#index'
end
