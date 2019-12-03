Rails.application.routes.draw do

  get 'sessions/new'
  get 'users/new'
  get :signup, to: 'users#new'
  get :login, to: 'sessions#new'
  get :logout, to: 'sessions#destroy'
  root 'tests#index'

  resources :users, only: :create
  resources :sessions, only: %i[create destroy]

  resources :tests do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end

    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end

end

