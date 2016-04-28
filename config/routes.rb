Rails.application.routes.draw do
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


#   Prefix Verb   URI Pattern                  Controller#Action
#         root GET    /                            markets#index
#      markets GET    /markets(.:format)           markets#index
#              POST   /markets(.:format)           markets#create
#   new_market GET    /markets/new(.:format)       markets#new
#  edit_market GET    /markets/:id/edit(.:format)  markets#edit
#       market GET    /markets/:id(.:format)       markets#show
#              PATCH  /markets/:id(.:format)       markets#update
#              PUT    /markets/:id(.:format)       markets#update
#      vendors GET    /vendors(.:format)           vendors#index
#              POST   /vendors(.:format)           vendors#create
#   new_vendor GET    /vendors/new(.:format)       vendors#new
#  edit_vendor GET    /vendors/:id/edit(.:format)  vendors#edit
#       vendor GET    /vendors/:id(.:format)       vendors#show
#              PATCH  /vendors/:id(.:format)       vendors#update
#              PUT    /vendors/:id(.:format)       vendors#update
#              DELETE /vendors/:id(.:format)       vendors#destroy
#        sales GET    /sales(.:format)             sales#index
#              POST   /sales(.:format)             sales#create
#     new_sale GET    /sales/new(.:format)         sales#new
#         sale GET    /sales/:id(.:format)         sales#show
#     products GET    /products(.:format)          products#index
#              POST   /products(.:format)          products#create
#  new_product GET    /products/new(.:format)      products#new
# edit_product GET    /products/:id/edit(.:format) products#edit
#      product GET    /products/:id(.:format)      products#show
#              PATCH  /products/:id(.:format)      products#update
#              PUT    /products/:id(.:format)      products#update
#              DELETE /products/:id(.:format)      products#destroy
# login_index GET    /login(.:format)             login#index
#              POST   /login(.:format)             login#create
#    new_login GET    /login/new(.:format)         login#new
#   edit_login GET    /login/:id/edit(.:format)    login#edit
#        login GET    /login/:id(.:format)         login#show
#              PATCH  /login/:id(.:format)         login#update
#              PUT    /login/:id(.:format)         login#update
#              DELETE /login/:id(.:format)         login#destroy


  root 'markets#index'
  resources :markets, except:[:destroy]
  resources :vendors
  resources :sales, except:[:edit, :destroy, :update]
  resources :products
  post "/login/vendor" => "login#vendorcreate"
  resources :login


end
