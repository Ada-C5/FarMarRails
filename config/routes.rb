Rails.application.routes.draw do

  root 'users#index'

  get  '/users/all_markets'  => 'users#all_markets', as: "all_markets"

  get  '/all_markets/:id'    => 'users#show', as: "single_market"

  get  '/markets'      => 'markets#market_index', as: "market"

  get  '/markets/new' => 'markets#new', as: "new"

  post '/markets'     => 'markets#create',  as: "create_market"

<<<<<<< HEAD
  get '/markets/update'  => 'markets#update', as: "update"

=======
>>>>>>> 992a80514a1e7cfd08404c45a2d2fbbcbfb3ee81
  get  '/vendors'      => 'vendors#index', as: "vendor"

  get  '/vendors/:id'  =>  'vendors#show', as: "vendor_info"

  get  '/all_sales/:id'    => 'vendors#sales', as: "vendor_sales"

  get  '/all_products/:id' => 'vendors#products', as: "vendor_products"













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
