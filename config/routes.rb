Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

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
    resource :customers, only: [:show, :edit, :update]
    get '/' => 'homes#top'
    get '/about' => 'homes#about'
    get '/quit_check' => 'customers#quit_check'
    patch '/withdraw' => 'customers#withdraw'
  end

end
