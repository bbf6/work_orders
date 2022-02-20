Rails.application.routes.draw do
  resources :client_branches
  resources :clients
  resources :client_manager_phones
  resources :client_managers
  resources :retainers
  resources :tickets
  resources :work_orders
  resources :thecnician_phones
  resources :thecnicians
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
