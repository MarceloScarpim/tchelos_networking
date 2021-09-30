Rails.application.routes.draw do  
  devise_for :admins, skip: [:registrations], controllers: { sessions: 'admins/sessions' }
  # root to: "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :admin do
    #admin/posts
    #admin/users
    root to: "home#index"
  end
end
