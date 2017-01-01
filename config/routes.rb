Rails.application.routes.draw do
  root 'root#index'
  
  namespace :v1 do
    ##
    # Authentication
    #
    resources :authorizations, only: [:create]
  end
end
