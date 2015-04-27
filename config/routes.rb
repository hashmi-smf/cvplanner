Rails.application.routes.draw do
  devise_for :users
  root 'events#index'

  resources :sites, only: [:index, :destroy, :new, :create]
  resources :events, except: :show do
    get :delete
  end
end
