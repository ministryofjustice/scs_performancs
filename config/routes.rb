Rails.application.routes.draw do
  root 'home#index'

  resources :reports, only: [:new, :create, :index, :edit, :update]
end
