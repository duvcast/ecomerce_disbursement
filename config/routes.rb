Rails.application.routes.draw do
  resources :disbursements
  resources :orders
  resources :shoppers
  resources :merchants
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
