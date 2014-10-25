Rails.application.routes.draw do

  get 'trophies/checker'

  post 'users/getscores' => 'users#getscores'
  devise_for :users, controllers: { registrations: 'registrations' }
  # devise_for :users

  devise_scope :user do
    root to: 'devise/sessions#new', as: 'home'
    # get "user/registrations/read", to: 'registrations#read', as: 'usersprofile'
  end

  post "/users/follow", to: "users#follow", as: :follow
  delete "/users/unfollow", to: "users#unfollow", as: :unfollow

  get 'activities/index'
  # resources :activites
  get 'games/read', as: 'games'
  get 'notifications/show' => 'notifications#show', as: 'notifications'
  get 'notifications/showalerts' => 'notifications#showalerts', as: 'allshouts'
  resources :users, :games, only: [:show]

  get 'users/edit' => 'users#edit', as: 'edit'
  post 'users/:id/update' => 'users#update', as: 'update'
  post 'users/:id/shout' => 'users#shout', as: 'shout'
  get 'users/:id/shoutmessage' => 'users#shoutmessage'
  get 'users/:id/read' => 'users#read'
  get 'users/:id/destroyshout' => 'users#destroyshout', as: 'destroyshout'

  get 'games/:id' => 'games#show'
  get 'games/:id/info' => 'games#info', as: 'game_info'
  get 'games/:id/editpopup' => 'games#edit', as: 'game_edit'

  get 'index/contact', as: 'contact'

  get 'games/play/:id' => 'games#play', as: 'play'

  get '/search' => 'search_results#index'
end
