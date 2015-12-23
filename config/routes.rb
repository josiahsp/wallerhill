Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :musics, :composers, :music, :welcome, :charges, :tracks, :books, :cart, :cart_items, :addresses

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
	get 'admin' => 'welcome#admin'
	get 'admin/music/:id/tracks' => 'welcome#tracks', as: :admin_tracks
	get 'admin/address-book/user/:id' => 'welcome#address_book', as: :admin_address_book
	get 'admin/user/:id/edit' => 'welcome#admin_edit_user', as: :admin_edit_user
	patch 'admin/user/:id/update' => 'welcome#admin_user_update', as: :admin_user_update
	match 'admin/user/:id' => 'welcome#user_destroy', :via => :delete, as: :admin_destroy_user
	get 'orders/admin/:id/ship' => 'welcome#ship_order', as: :ship_order
	get 'orders/user' => 'welcome#orders', as: :user_orders
	get 'orders/admin' => 'welcome#admin_orders', as: :admin_orders
	get 'orders/admin/order/:id' => 'welcome#admin_view_order', as: :admin_view_order

  get 'users/:id/profile' => 'welcome#user_profile', as: :user_profile
	get 'cart_items' => 'cartitem#create', as: :add_to_cart
	get 'update_cart_item' => 'cartitem#update', as: :update_cart_item

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  # resources :books

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
