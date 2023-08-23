Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  devise_for :admin,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    resources :products, only: [:new, :create, :index, :show, :edit, :update ]
    resources :genres, only: [:index, :create, :edit, :update]

  end


  scope module: :public do
    root to: 'homes#top'
    resources :products, only: [:index, :show]
    resources :cart_items, only: [:new, :create]
    get "/genres/:id", to: "products#genre_products", as: "genre_products"
  end

end
