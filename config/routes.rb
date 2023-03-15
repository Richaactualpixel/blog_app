Rails.application.routes.draw do
  devise_for :users
  
  namespace :api, defaults: {format: :json} do
    namespace :v1 do 
      devise_scope :user do
        post "sign_up", to: "registrations#create"
        post "sign_in", to: "sessions#create"
      end

      resources :posts
      # post "create_post", to: "posts#create"
      # get "get_posts", to: "posts#index"
    end
  end
end