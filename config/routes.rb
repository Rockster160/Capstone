Rails.application.routes.draw do

  match '/users', to: 'users#index', via: 'get'
  match '/users/:id', to: 'users#show', via: 'get'

  devise_for :admins
  get 'index/contact'


  get 'index/contact'

  root 'users#show'

  get 'games/create'


  devise_for :users, controllers: { registrations: 'user/registrations' }
  devise_scope :user do
    get "user/registrations/read", to: 'registrations#read', as: 'usersprofile'
  end

  get 'games/create', as: 'creategames'
  get 'games/read'
  get 'games/update'
  get 'games/destroy'

  # get 'profile/read'
  # get 'profile/update'
  # get 'profile/destroy'



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

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
