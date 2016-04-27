Rails.application.routes.draw do

  root 'home#index'

  resources :markets, except: :destroy do
    resources :vendors
  end

  resources :vendors do
    resources :products
    get '/sales' => 'sales#index'
  end
end
