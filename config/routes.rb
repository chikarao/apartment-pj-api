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
      post "get_user", to: "users#get_user"
      patch "update_user", to: "users#update"

      resources :flats do
        resources :images
      end

      resources :flats do
        resources :places
      end

      resources :flats do
        resources :views
      end

      resources :flats do
        resources :flat_languages
      end

      resources :flats do
        resources :calendars
      end

      # namespace :users do
      resources :bank_accounts do
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
        get 'conversations/conversations_by_user', to: 'conversations#conversations_by_user'
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
      post 'fetch_translation', to: 'bookings#fetch_translation'
      post 'email_documents', to: 'bookings#email_documents'
      post 'mark_documents_signed', to: 'bookings#mark_documents_signed'

      resources :agreements do
      end
      post 'update_agreement_fields', to: 'agreements#update_agreement_fields'

      resources :document_fields do
      end

      resources :document_inserts do
      end

      resources :insert_fields do
      end

      resources :buildings do
      end

      resources :buildings do
        resources :building_languages
      end

      resources :facilities do
      end

      resources :inspections do
      end

      post 'fetch_facilities_for_flat', to: 'facilities#fetch_facilities_for_flat'
      post 'search_buildings', to: 'buildings#search_buildings'
      #
      post 'blockout_dates_ical', to: 'bookings#blockout_dates_ical'
      post 'create_contract', to: 'bookings#create_contract'

      post 'update_conversation', to: 'conversations#update_conversation'
      resources :conversations do
        resources :messages
      end

      resources :likes do
      end

      resources :profiles do
      end

      resources :reviews do
      end

      resources :contractors do
      end

      resources :contracts do
      end

      resources :staffs do
      end

      resources :assignments do
      end

      namespace :users do
        # use get when there are no params
        get 'likes/likes_by_user', to: 'likes#likes_by_user'
        post 'likes/likes_by_flat', to: 'likes#likes_by_flat'
      end
      # stripe routes
      post 'new_subscription', to: 'stripe#new_subscription'
      post 'retrieve_customer', to: 'stripe#retrieve_customer'
      post 'update_card_info', to: 'stripe#update_card_info'
      post 'new_customer', to: 'stripe#new_customer'
      post 'delete_card', to: 'stripe#delete_card'
      post 'add_card', to: 'stripe#add_card'
      post 'update_customer', to: 'stripe#update_customer'
      post 'make_payment', to: 'stripe#make_payment'
      post 'get_user_credentials', to: 'stripe#get_user_credentials'
      post 'deauthorize_user', to: 'stripe#deauthorize_user'

      # resources :books, only: [:index, :show] do
      #   #do since book has many reviews
      #   resources :reviews, only: [:index, :show, :create, :update, :destroy]
      # end
    end
  end
end
