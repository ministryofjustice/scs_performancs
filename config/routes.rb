Rails.application.routes.draw do
  root 'home#index'

  resources :reports, only: [:new, :create, :index, :edit, :update] do
    get :approve, on: :member

    resources :reviews, only: [:edit, :update], constraints: { id: /mid_year|end_year/ }
  end
end
