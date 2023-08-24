Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    resources :customers, only: [ :index, :create, :show, :edit, :update]
    resources :products, only: [:new, :create, :index, :show, :edit, :update,]
    resources :orders, only: [:index, :show, :update]
    resources :order_details, only: [:update]
    resources :genres, only: [:index, :create, :edit, :update]
  end

  scope module: :public do
    root to: 'homes#top'
    get "/genres/:id", to: "products#genre_products", as: "genre_products"
    resources :products, only: [:index, :show]
    resources :cart_items, only: [:index, :create, :update, :destroy] do
      collection do
        delete 'destroy_all'
      end
    end
    resources :order_details , only: [:index, :show]
    resources :addresses, only: [:index, :create, :destroy, :edit, :update]
    resources :orders, only: [:new, :create] do
      collection do
        post "confirm"
        get "complete"
      end
    end
  end

end
