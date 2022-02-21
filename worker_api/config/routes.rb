Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  scope 'api' do
    resources :client_branches
    resources :clients
    resources :client_manager_phones
    resources :client_managers
    resources :retainers
    resources :tickets
    resources :work_orders
    resources :thecnician_phones
    resources :thecnicians
  end
end
