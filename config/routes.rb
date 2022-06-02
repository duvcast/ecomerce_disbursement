Rails.application.routes.draw do
  resources :order_fees
  resources :orders
  resources :shoppers
  resources :merchants

  get '/api/v1/disburses/disbursements_by_merchant_by_week' => 'api/v1/disburses#disbursements_by_merchant_by_week'
end
