Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  scope 'api' do
    resources :client_branches
    resources :clients
    resources :retainers
    resources :tickets
    resources :work_orders
    get '/work_orders/by_thecnician/:thecnician_id' => 'work_orders#by_thecnician'
    resources :thecnicians
  end
end
