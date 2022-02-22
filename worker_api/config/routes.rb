Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  scope 'api' do
    resources :client_branches
    resources :clients
    resources :retainers
    resources :tickets
    get '/work_orders/by_thecnician/:thecnician_id' => 'work_orders#by_thecnician'
    put '/work_orders/mark_as_done/:id' => 'work_orders#work_done'
    get '/work_orders/list_pending' => 'work_orders#pending'
    get '/work_orders/list_done' => 'work_orders#done'
    resources :work_orders
    resources :thecnicians
  end
end
