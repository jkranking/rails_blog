Rails.application.routes.draw do

	root "posts#index"

	get '/posts', to: 'posts#index', as: 'posts'
	get '/users/:id/posts', to: 'posts#user_posts_index', as: 'user_posts'

	resources :users do 
	  resources :posts, except: [:index]
	end 

end

