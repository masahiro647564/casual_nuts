Rails.application.routes.draw do
  devise_for :users
  root 'homes#index'
  get 'homes', to: 'homes#index'
  resources :posts do
    resources :comments, expect: :index
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
