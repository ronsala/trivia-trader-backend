Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: %i[index create update delete]
      resources :categories, only: %i[index]
      resources :games
      resources :questions
      post 'find_user' => 'users#find'
      post '/signup', to: 'users#signup'
      post '/login', to: 'auth#create'
      post '/verify', to: 'auth#verify'
    end
  end
end
