Rails.application.routes.draw do
  resources :comments
  resources :blogs
  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }
      #get '/getconfirm/', to: 'dashboard#before_confirmation', as: 'email_confirmation_page'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'dashboard#index'
end
