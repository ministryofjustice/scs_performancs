Rails.application.routes.draw do
  root to: redirect('/reports')

  resources :reports, only: [:new, :create, :index, :edit, :update] do
    resources :approvals, only: [:edit, :update], constraints: { id: /initial|mid_year|end_year/ }
    resources :reviews, only: [:edit, :update], constraints: { id: /mid_year|end_year/ }
  end

  resources :agreements, only: [:new, :create, :index, :edit, :update] do
  end

  get '/profile/edit', to: 'profiles#edit', as: :edit_profile
  put '/profile', to: 'profiles#update', as: :profile

  resources :tokens, only: [:new, :create, :show]
  resource :session, only: [:destroy]
end
