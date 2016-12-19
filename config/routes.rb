Rails.application.routes.draw do
  root 'demos#index'
  
  namespace :v1 do
    resources :jwt, only: [:index]
  end
end
