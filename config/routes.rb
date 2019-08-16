Rails.application.routes.draw do
  devise_for :users
  resources :photos do
    resources :comments
  end

  resources :events do
    resources :comments
  end

  resources :articles do
    member do
      put "like", to: "articles#like"
      put "dislike", to: "articles#dislike"
    end
    resources :comments
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'articles#index'
end