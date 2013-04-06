Medishare::Application.routes.draw do
  resources :patients do
  	collection { post :import }
  end

  resources :bednets_and_illinesses

  resources :health_facilities

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users

  # Api resources
  namespace :api do
    namespace :private do
      namespace :v1 do
          resources :patients
      end
    end
  end
end