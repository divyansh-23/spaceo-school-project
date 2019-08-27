Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  
  devise_scope :user do
  	root to: "home#index"
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
