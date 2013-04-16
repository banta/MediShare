Medishare::Application.routes.draw do
  resources :medicines


  resources :diseases


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

  namespace :api do
    namespace :private do
      namespace :v1 do
          resources :patients
          resources :diseases
      end
    end
  end
end