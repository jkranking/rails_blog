Rails.application.routes.draw do

	root "posts#index"

	get '/posts', to: 'posts#index', as: 'posts'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

	resources :users do 
	  resources :posts
	end 

end

