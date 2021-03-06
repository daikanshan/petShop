Rails.application.routes.draw do

  post 'modify_info' => 'purchaser/modify#update'
  get 'modify_info' => 'purchaser/modify#index'
  namespace :seller do
  get 'deal/result',as: :result
  end

  namespace :seller do
  post 'deal/sendout',as: :sendout
  end

  namespace :seller do
  get 'order/index',as: :order
  end

  root 'purchaser/home#index'
  get 'login' => 'admin/session#new'
  get 'signup' => 'admin/users#new'
  post 'login' => 'admin/session#create'
  post 'logout' => 'admin/session#destroy'
  get 'seller' => 'seller/home#index'
  get 'admin' => 'admin/home#index'
  namespace :admin do
    resources :applcts
    resources :users
    get 'product' => 'product#index'
  end

  namespace :purchaser do
    resources :lists
    resources :carts
    resources :orders
  end

  namespace :seller do
    resources :products
  end
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
