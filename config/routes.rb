Rails.application.routes.draw do
  root 'auth#index'
  
  namespace :v1 do
    resources :auth, only: [:index, :create, :update]
  end
end
