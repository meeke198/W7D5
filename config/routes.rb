Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :users
resources :posts
resources :subs, except: [:destroy]
resource :session, except: [:create, :new, :destroy]
end
