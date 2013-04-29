Medishare::Application.routes.draw do
  resources :data_minings


  resources :prescription_lines


  resources :medicines


  resources :diseases
  resources :prescriptions, :only => [:create, :update, :destroy]


  resources :patients do
  	collection { post :import }
  end

  resources :bednets_and_illinesses

  resources :health_facilities do
    collection { get :analytics }
    collection { get :data_mining }
    collection { post :xdata_mining }
  end

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