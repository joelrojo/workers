Rails.application.routes.draw do
  root 'hood_searches#index'
  resources :hood_searches
  resources :jobs, only: :show
end
