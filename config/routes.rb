Rails.application.routes.draw do
  root 'home#index'

  resources :reports, only: [:new, :create, :index, :edit, :update] do
    get :approve, on: :member
    get :mid_year_review, on: :member
    post :mid_year_review_update, on: :member
  end
end
