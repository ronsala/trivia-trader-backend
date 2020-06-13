Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: %i[index create update delete]
      resources :categories, only: %i[index]
      post 'user_token' => 'user_token#create'
      post 'find_user' => 'users#find'
    end
  end
end
