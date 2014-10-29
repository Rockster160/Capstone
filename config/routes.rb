Rails.application.routes.draw do

  get 'index/contact', as: 'contact'
  get 'index/home' => 'index#home', as: 'home'
  get 'index/:id/partialswitch' => 'index#partialswitch', as: 'homeFormSwitch'

  devise_for :users, controllers: { registrations: 'registrations' }
  devise_scope :user do
    root to: 'devise/sessions#new', as: 'login'
  end

  get 'games/read', as: 'games'
  resources :users, :games, only: [:show]
  get 'users/:id/read' => 'users#read'

  get 'notifications/show' => 'notifications#show', as: 'notifications'
  get 'notifications/:id/useralerts' => 'notifications#useralerts', as: 'usershouts'
  get 'notifications/:id/gamealerts' => 'notifications#gamealerts', as: 'gameshouts'

  get 'users/edit' => 'users#edit', as: 'edit'
  get 'trophies/trophy_tab' => 'trophies#show', as: 'show_trophies'

  get 'users/:id/shoutmessage' => 'users#shoutmessage'
  get 'users/:id/destroyshout' => 'users#destroyshout', as: 'destroyshout'

  post 'users/:id/update' => 'users#update', as: 'update'
  post 'users/:id/shout' => 'users#shout', as: 'shout'
  post 'games/:id/shout' => 'games#shout', as: 'gameshout'
  post 'users/getscores' => 'users#getscores'
  post "/users/follow", to: "users#follow", as: :follow
  delete "/users/unfollow", to: "users#unfollow", as: :unfollow

  get 'games/:id' => 'games#show'
  get 'games/:id/info' => 'games#info', as: 'game_info'
  get 'games/:id/editpopup' => 'games#edit', as: 'game_edit'

  get 'games/play/:id' => 'games#play', as: 'play'

  get '/search' => 'search_results#index'
end
