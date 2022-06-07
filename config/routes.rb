Rails.application.routes.draw do
  resources :tasks
  resources :users
  post '/users/login' => 'users/login'
  post '/tasks/set_completed' => 'tasks#set_completed'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "application#index"
end
