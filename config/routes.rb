Due::Application.routes.draw do

	resources :home
		root :to => 'home#index'
		match '/' => 'home#index'

	resources :groups
	resources :users
	resources :posts, only: [:new, :delete]
	match "signup" => "users#new"
	match "logout" => "sessions#destroy"
	match "login" => "sessions#new"
end
