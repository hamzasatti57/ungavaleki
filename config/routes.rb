Rails.application.routes.draw do
  resources :loans
  resources :time_stamps
  resources :plugs
  resources :operations
  resources :non_senses
  resources :why_nots
  resources :revenues
  resources :accounts
  get 'dashboard', to: 'home#index'
  get 'update_status', to: 'loans#update_status'
  resources :users, only: [:index, :show, :new, :edit, :create, :update, :destroy]
  devise_for :users, :controllers => {
    :sessions => "users/sessions",
    :confirmations => "users/confirmations",
    :passwords => "users/passwords",
    :registrations => "users/registrations",
    :unlocks => "users/unlocks",
  }
  devise_scope :user do
    root :to => 'users/sessions#new'
    get "sign_in", to: "users/sessions#new"
    get "sign_up", to: "users/registrations#new"
    get "sign_out", to: "users/sessions#destroy"
  end
end
