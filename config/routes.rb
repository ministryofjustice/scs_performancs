Rails.application.routes.draw do
  root 'home#index'

  resources :reports, only: [:new, :create, :index, :edit, :update] do
    get :approve, on: :member
    get :mid_year_approve, on: :member

    resources :approvals, only: [:edit, :update], constraints: { id: /initial|mid_year|end_year/ }
    resources :reviews, only: [:edit, :update], constraints: { id: /mid_year|end_year/ }
  end
end
