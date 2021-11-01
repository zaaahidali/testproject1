Rails.application.routes.draw do
  resources :businesses
  devise_for :users
  get '/businesses/new' => 'home#index', as: "first_route"
  # get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "new_task" ,to: "tasks#new"

  post "new_task", to: "tasks#create"

  get "admin_view", to: "businesses#admin_view"
  # resources :tasks
  root "home#index"
end
