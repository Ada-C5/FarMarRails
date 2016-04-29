Rails.application.routes.draw do

  root 'home#index'

  resources :markets, except: :destroy do
    resources :vendors
  end

  resources :vendors, only: [:index, :show] do
    resources :products, except: [:index, :show]
    resources :sales, only: [:new, :create]
    # get '/sales' => 'sales#index'
  end
end
