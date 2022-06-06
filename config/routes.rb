Rails.application.routes.draw do
  resources :films
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'search', to: "films#search"
  # Defines the root path route ("/")
  root "films#index"
end
