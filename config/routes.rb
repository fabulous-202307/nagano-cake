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
    resources :products, only: [:new, :create, :index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
  end


  scope module: :public do
    get "customer/mypage" => "customers#mypage", as:"mypage"
    get "customer/infomation/edit/:full_name" => "customers#edit", as:"infomation"
    get "customer/infomatio/:full_namen" => "customers#update"
    get "customer/confirm_withdraw" => "customuers#confirm_withdraw", as:"confirm_withdraw"
    get "customers/withdraw/:full_name" => "customers#withdraw", as:"withdraw"
    patch  '/customers/withdraw' => 'customers#withdraw'
    root to: 'homes#top'
  end



end
