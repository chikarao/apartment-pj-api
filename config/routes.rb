Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      devise_scope :user do
        post "sign_up", to: "registrations#create"
        post "sign_in", to: "sessions#create"
        delete "log_out", to: "sessions#destroy"
        post 'password/forgot', to: 'passwords#forgot'
        post 'password/reset', to: 'passwords#reset'
      end

      get "confirm_email/:confirm_token", to: "users#confirm_email"
      post "facebook", to: "users#facebook"

      resources :flats do
        resources :images
      end

      resources :flats do
        resources :places
      end

      # resources :users do
      #   resources :flats, only: [:index]
      # end

      namespace :users do
        resources :flats, only: [:index]
      end

      namespace :users do
        resources :bookings, only: [:index]
      end

      namespace :users do
        post 'conversations/conversation_by_flat', to: 'conversations#conversation_by_flat'
        post 'conversations/conversations_by_user_and_flat', to: 'conversations#conversations_by_user_and_flat'
        post 'conversations/conversations_by_user', to: 'conversations#conversations_by_user'
      end

      namespace :users do
        get 'profiles/profile_for_user', to: 'profiles#profile_for_user'
      end

      namespace :images do
        post 'upload', to: 'images#upload'
        post 'upload_for_profile', to: 'images#upload_for_profile'
        post 'destroy', to: 'images#destroy'
      end

      namespace :reviews do
        post 'review_for_booking_by_user', to: 'reviews#review_for_booking_by_user'
        post 'reviews_for_flat', to: 'reviews#reviews_for_flat'
      end

      resources :images do
      end

      resources :bookings do
      end

      resources :conversations do
        resources :messages
      end

      resources :likes do
      end

      resources :profiles do
      end

      resources :reviews do
      end

      namespace :users do
        # use get when there are no params
        get 'likes/likes_by_user', to: 'likes#likes_by_user'
        post 'likes/likes_by_flat', to: 'likes#likes_by_flat'
      end

      # resources :books, only: [:index, :show] do
      #   #do since book has many reviews
      #   resources :reviews, only: [:index, :show, :create, :update, :destroy]
      # end
    end
  end
end
