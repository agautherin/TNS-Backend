Rails.application.routes.draw do
  resources :questions
  resources :choices
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "/quiz", to: "questions#getquestions"
  
  namespace :api do
    namespace :v1 do
      resources :users
      post '/login', to: 'auth#create'
      get '/token', to: 'auth#token_log_in'
    end
  end
end
