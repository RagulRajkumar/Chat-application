Rails.application.routes.draw do
  get 'messages/create'
  devise_for :users
  resources :users do
    member do
      get :chat
    end
  end
  root to: "users#index"
  resources :messages
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
