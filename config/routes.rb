Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  root 'far_mar#index'

  get    "/markets"          => "markets#index",   as: :markets
  post   "/markets"          => "markets#create"
  get    "/markets/:id"      => "markets#show",    as: :market
  patch  "/markets/:id"      => "markets#update"
  delete "/markets/:id"      => "markets#destroy"
  get    "/markets/new"      => "markets#new",     as: :new_market
  get    "/markets/:id/edit" => "markets#edit",    as: :edit_market

  get    "/vendors"          => "vendors#index",   as: :vendors
  get    "/vendors/:id"      => "vendors#show",    as: :vendor

  # product related routes
  get    "/vendors/:id/products"                  => "vendors#products",        as: :products
  get    "/vendors/:id/products/new"              => "vendors#new_product",     as: :new_product
  get    "/vendors/:id/products/:product_id/edit" => "vendors#edit_product",    as: :edit_product
  post   "/vendors/:id/products"                  => "vendors#create_product"
  patch  "/vendors/:id/products/:product_id"      => "vendors#update_product"
  delete "/vendors/:id/products/:product_id"      => "vendors#destroy_product"






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
