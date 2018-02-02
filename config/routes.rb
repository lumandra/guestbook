Rails.application.routes.draw do
  resources :messages, only: [:index, :show, :create]

  root 'messages#index'
end
