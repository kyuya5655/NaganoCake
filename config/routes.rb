Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  scope module: :public do
    resource :customers, only: [:show, :update]
  end

  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: 'admin/sessions',
  }

  namespace :admin do
    root :to => 'homes#top'
    resources :items
    resources :customers, only: [:index, :show, :edit, :update]
  end

  scope module: :public do
    root :to => 'homes#top'
    get '/about' => 'homes#about'
    get '/customers' => 'customer#show'
    get '/information/edit' => 'customers#edit'
    patch '/customers' => 'customers#update'
    get '/quit_check' => 'customers#quit_check'
    patch '/withdraw' => 'customers#withdraw'
    resources :items, only: [:index, :show]
    resources :cart_items, only: [:index, :update, :create]
    delete '/destroy' => 'cart_items#destroy'
    delete '/destroy_all' => 'cart_items#destroy_all'
    resources :orders, only: [:new, :index, :show, :create]
    post '/check' => 'orders#check'
    get '/conpletion' => 'oeders#completion'
  end



end
