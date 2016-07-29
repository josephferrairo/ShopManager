Rails.application.routes.draw do
  root 'static_pages#index'

  resources :procedures
  resources :work_instructions
  resources :customers do
    resources :parts
  end
end
