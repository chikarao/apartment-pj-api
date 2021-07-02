Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      devise_scope :user do
        post "sign_up", to: "registrations#create"
        post "sign_in", to: "sessions#create"
        # use post for log_out to simplify sending token in header
        # delete allows for data such as headers to be sent in URI
        # post "log_out", to: "sessions#destroy"
        post "log_out", to: "sessions#log_out"
        post 'password/forgot', to: 'passwords#forgot'
        post 'password/reset', to: 'passwords#reset'
        # set_online_offline for redis online offline setting purposes
        post "set_get_online_offline", to: "sessions#set_get_online_offline"
        post "get_app_base_objects", to: "sessions#get_app_base_objects"
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
        post 'upload_for_flat', to: 'images#upload_for_flat'
        post 'upload_for_profile', to: 'images#upload_for_profile'
        post 'destroy', to: 'images#destroy'
        post 'destroy_images', to: 'images#destroy_images'
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
      post 'fetch_template_objects', to: 'bookings#fetch_template_objects'

      resources :agreements do
      end
      post 'update_agreement_fields', to: 'agreements#update_agreement_fields'
      post 'save_template_agreement_fields', to: 'agreements#save_template_agreement_fields'
      post 'fetch_user_agreements', to: 'agreements#fetch_user_agreements'
      post 'add_existing_agreements', to: 'agreements#add_existing_agreements'

      post 'agreement_create', to: 'agreements#agreement_create' #For rake task create_standard_documents
      post 'fetch_document_fields_for_page', to: 'agreements#fetch_document_fields_for_page' #For rake task create_standard_documents
      post 'cache_document_fields_for_pages', to: 'agreements#cache_document_fields_for_pages' #For rake task create_standard_documents
      post 'delete_cached_document_fields_for_pages', to: 'agreements#delete_cached_document_fields_for_pages' #For rake task create_standard_documents

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

      # to retrieve Googlemap bounds object keys; in flats controller
      post 'get_google_map_bounds_keys', to: 'flats#get_google_map_bounds_keys'
      # route for action cable when connecting websocket
      mount ActionCable.server => '/cable'

      # resources :books, only: [:index, :show] do
      #   #do since book has many reviews
      #   resources :reviews, only: [:index, :show, :create, :update, :destroy]
      # end
    end
  end
end
