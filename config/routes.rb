Rails.application.routes.draw do
  root "todos#index"
  resources :todos do
   resources :comments
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
