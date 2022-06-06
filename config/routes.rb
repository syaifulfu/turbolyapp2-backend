Rails.application.routes.draw do
  resources :tasks
  resources :users
  post '/users/login' => 'users/login'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "application#index"
end
