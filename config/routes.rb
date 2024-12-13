Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Admin
  get "admin" => "admin#homepage", as: :admin
  namespace :admin do
    resources :categories
    resources :products
  end

  # Catalog
  get "catalog(/:category)" => "shop#catalog", as: :catalog
  get "catalog/product/:uuid" => "shop#product", as: :catalog_product
  post "catalog/compatible_parts/:customizable_part_id" => "shop#compatible_parts", as: :compatible_parts

  # Cart
  get "cart" => "cart#show", as: :cart
  post "cart/items/new" => "cart#add_item", as: :cart_add_item
  patch "cart/item/:id" => "cart#update_item", as: :cart_update_item
  delete "cart/item/:id" => "cart#delete_item", as: :cart_delete_item

  # Defines the root path route ("/")
  root "shop#homepage"
end
