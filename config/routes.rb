Medishare::Application.routes.draw do
  resources :bednets_and_illinesses

  resources :health_facilities

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
end