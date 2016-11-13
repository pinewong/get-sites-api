Rails.application.routes.draw do
  root 'demos#index'
  resources :demos
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
