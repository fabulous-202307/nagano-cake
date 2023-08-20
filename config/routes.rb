Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  devise_for :admin,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }















































  scope module: :public do
    resources :cart_items, onry: [:index, :create, :update, :destroy] do
      collection do
        delete 'destroy_all'
      end
    end
  end
end

