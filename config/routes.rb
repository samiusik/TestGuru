Rails.application.routes.draw do

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }
  
  get 'users/new'

  get 'gists/index'

  root 'tests#index'

  namespace :admin do
    resources :tests, only: :index do
      patch :update_inline, on: :member
    end
  end

    resources :tests, only: :index do
      member do
        post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end

    namespace :admin do
    resources :tests do

      resources :questions, shallow: true do
        resources :answers, shallow: true
      end
    end
    resources :gists, only: :index
  end

end

