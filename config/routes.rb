Rails.application.routes.draw do
  devise_for :users
  root 'homes#index'
  get 'homes', to: 'homes#index'
  get "rakuten/items" => "rakuten#items_search"
  resources :posts do
    resources :likes, only: [:create, :destroy]
  end
  resources :posts do
    resources :comments, expect: :index
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "posts#index"
  resources :posts
end
