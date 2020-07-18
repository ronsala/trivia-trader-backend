Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: %i[index create update delete]
      resources :categories, only: %i[index] do
        resources :games
      end

      resources :games
      post 'user_token' => 'user_token#create'
      post 'find_user' => 'users#find'
      post 'login', to: 'users#login'
      get '/auto_login', to: 'users#auto_login'
    end
  end
end
