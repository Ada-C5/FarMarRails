Rails.application.routes.draw do

root 'home#index'

#*** MARKET
  resources :markets, except:[:destroy]

#*** VENDOR
resources :vendors

get '/vendors/:vendor_id/sales' => 'sales#index', as: 'vendor_sale' # go to slash ablums should execute index method

# get
# GET    /parents/:parent_id/children/:id(.:format)      children#show
# GET    /parents/:parent_id/children(.:format)          children#index

#*** PRODUCT
  resources :products

  get '/vendors/:vendor_id/products' => 'products#index', as: 'vendor_product' # go to slash ablums should execute index method
  get '/vendors/:vendor_id/products' => 'products#delete', as: 'product_delete'


#*** SALES
  resources :sales, only:[:index, :show, :create]



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
