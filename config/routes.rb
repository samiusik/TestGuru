Rails.application.routes.draw do
  
  root to: 'tests#index'

  resources :tests

  resources :tests
    resources :questions, shallow: true
  
  get '/tests/:id/start', to: 'tests#start'

end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
