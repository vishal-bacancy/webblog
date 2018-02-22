Rails.application.routes.draw do
  require 'sidekiq/web'
 mount Sidekiq::Web, at: '/sidekiq'
  get 'relationships/create'

  get 'relationships/destroy'

  get 'admincomments/new'

  get 'admincomments/edit'

  get 'admincomments/index'

  get 'admincomments/show'

  get 'adminblogs/new'

  get 'adminblogs/edit'

  get 'adminblogs/index'

  get 'adminblogs/show'

  get 'admin_dashboard/index'

  get 'adminusers/index'

  get 'adminusers/new'
  
  post 'adminusers/create'
  patch 'adminusers/update'
  get 'adminusers/:id/edit', to: 'adminusers#edit', as: 'edit_adminuser'
  get 'adminusers/:id', to: 'adminusers#show', as: 'adminuser'
  delete 'adminusers/:id/destroy', to: 'adminusers#destroy', as: 'delete_adminuser' 

  post 'adminblogs/create'
  patch 'adminblogs/update'
  get 'adminblogs/:id/edit', to: 'adminblogs#edit', as: 'edit_adminblog'
  get 'adminblogs/:id', to: 'adminblogs#show', as: 'adminblog'
  delete 'adminblogs/:id/destroy', to: 'adminblogs#destroy', as: 'delete_adminblog' 

  post 'admincompshments/create'
  patch 'admincomments/update'
  get 'admincomments/:id/edit', to: 'admincomments#edit', as: 'edit_admincomment'
  get 'admincomments/:id', to: 'admincomments#show', as: 'admincomment'
  delete 'admincomments/:id/destroy', to: 'admincomments#destroy', as: 'delete_admincomment' 


  resources :comments
  resources :blogs
  resources :relationships,       only: [:create, :destroy]
  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }

    resources :relationships do
    member do
      get :following, :followers
    end
  end
      #get '/getconfirm/', to: 'dashboard#before_confirmation', as: 'email_confirmation_page'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'dashboard#index'
end
