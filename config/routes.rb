Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'sessions/create'

  delete 'sessions/destroy'

  get 'logins/new'
  post 'logins/create'

  resources :users
   resources :arts do 
    resources :reviews, except: [:show, :index]
  end
  

  root 'arts#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
