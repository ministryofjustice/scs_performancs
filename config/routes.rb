Rails.application.routes.draw do
  root 'home#index'

  resources :reports, only: [:new, :create, :index, :edit, :update] do
    resources :approvals, only: [:edit, :update], constraints: { id: /initial|mid_year|end_year/ }
    resources :reviews, only: [:edit, :update], constraints: { id: /mid_year|end_year/ }
  end

  resources :tokens, only: [:new, :create, :show]
  resource :session, only: [:destroy]
end
