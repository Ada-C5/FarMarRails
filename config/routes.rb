Rails.application.routes.draw do
  get '/' => 'users#index'

  resources :markets

  get '/vendors/new', to: "vendors#new", as: "new_vendor"
  post '/vendors', to: "vendors#create"
  get '/vendors/:id/edit', to: "vendors#edit", as: "vendor"
  patch '/vendors/:id/edit', to: "vendors#update"
  delete '/vendors/:id', to: "vendors#delete", as: "delete_vendor"
  get '/vendors/', to: "vendors#index", as: "index_vendor"

  get '/products/new', to: "products#new"
  post '/products/', to: "products#create"
  get '/products/:id/edit', to: "products#edit", as: "product"
  patch 'product/:id/edit', to: "products#update"
  get '/products/vendor/:id/', to: "products#show", as: "products_show"
  patch '/products/:id', to: "products#update"
  get '/products/', to: "products#index"
  delete '/products/:id', to: "products#destroy"

  get '/sales/new', to: "sales#new"
  get '/sales/:id', to: "sales#show", as: "sales_show"
  post '/sales/', to: "sales#create"
  get '/sales/', to: "sales#index"

  #I'm unsure about many of these routes because I'm confused by markets creating vendors, users viewing markets, and vendors creating all the things. Let's go over it before continuing!



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
