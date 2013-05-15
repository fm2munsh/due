Due::Application.routes.draw do

	resources :users
	resources :home
	resources :sessions

	root :to => 'home#index'
	match '/' => 'home#index'



end
