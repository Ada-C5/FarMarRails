Rails.application.routes.draw do

  get 'farmar/index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'farmar#index'

  resources :markets, except: [:destroy] do
    resources :vendors
  end

  resources :vendors
  # get the sales of this vendor
  get 'vendors/:id/sales' => 'sales#index', as: :sales

  # create a new sale for vendor
  get 'vendors/:id/sales/new' => 'sales#new', as: :new_sale
  post'vendors/:id/sales'     => 'sales#create'

  get 'vendors/:vendor_id/products' =>  'products#index', as: :products
  get 'vendors/:vendor_id/products/new' => 'products#new', as: :new_product
  get 'vendors/:vendor_id/products/:id'  => 'products#show', as: :product

  post 'vendors/:vendor_id/products'    => 'products#create'

  get 'products/:id/edit' => 'products#edit', as: :edit_product
  put 'products/:id'      => 'products#update'
  delete 'products/:id'   => 'products#destroy'


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
