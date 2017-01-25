Rails.application.routes.draw do

	root "posts#index"

	get '/posts', to: 'posts#index', as: 'posts'
	get '/users/:user_id/posts', to: 'posts#user_posts_index', as: 'user_posts'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

	resources :users, except: :index do 
	  resources :posts, except: :index
	end 

end

