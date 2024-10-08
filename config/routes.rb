Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  # Route for fetching current user details
  get '/current_user', to: 'users#show'

  resources :pets do
    post 'upload', on: :member
    post 'profile_picture', on: :member
    resources :vaxs, only: [:index, :create, :destroy] 
    member do
      patch 'edit_profile', action: :update, as: 'edit_profile' 
    end
    resources :groomers
    resources :vets
  end

  

end
