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
    get '' => 'homes#top'
  end

  scope module: :public do
    get '/' => 'homes#top'
    get '/about' => 'homes#about'
    get '/information/edit' => 'customers#edit'
    get '/quit_check' => 'customers#quit_check'
    patch '/withdraw' => 'customers#withdraw'
  end

end
