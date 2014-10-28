Rails.application.routes.draw do

  get 'index/contact', as: 'contact'
  get 'index/home' => 'index#home', as: 'home'

  devise_for :users, controllers: { registrations: 'registrations' }
  devise_scope :user do
    root to: 'devise/sessions#new', as: 'login'
  end

  get 'games/read', as: 'games'
  resources :users, :games, only: [:show]
  get 'users/:id/read' => 'users#read'

  get 'notifications/show' => 'notifications#show', as: 'notifications'
  get 'notifications/showalerts' => 'notifications#showalerts', as: 'allshouts'

  get 'users/edit' => 'users#edit', as: 'edit'
  get 'trophies/checker'

  get 'users/:id/shoutmessage' => 'users#shoutmessage'
  get 'users/:id/destroyshout' => 'users#destroyshout', as: 'destroyshout'

  post 'users/:id/update' => 'users#update', as: 'update'
  post 'users/:id/shout' => 'users#shout', as: 'shout'
  post 'users/getscores' => 'users#getscores'
  post "/users/follow", to: "users#follow", as: :follow
  delete "/users/unfollow", to: "users#unfollow", as: :unfollow

  get 'games/:id' => 'games#show'
  get 'games/:id/info' => 'games#info', as: 'game_info'
  get 'games/:id/editpopup' => 'games#edit', as: 'game_edit'

  get 'games/play/:id' => 'games#play', as: 'play'

  get '/search' => 'search_results#index'
end
