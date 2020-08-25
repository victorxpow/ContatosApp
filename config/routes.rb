Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  resources :customers do
    get 'addcontact', on: :member
  end
  resources :contacts
end
