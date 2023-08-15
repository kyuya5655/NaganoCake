Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_for :customers, skip: [:passwords], controllers: {
    registations: "public/registrarions",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrarions, :passwords], controllers: {
    sessions: 'admin/sessions',
  }

  namespace :admin do
    get '' => 'homes#top'
  end

end
