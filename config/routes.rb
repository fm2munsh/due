Due::Application.routes.draw do

	resources :home
		root :to => 'home#index'
		match '/' => 'home#index'

	resources :sessions
		get "logout" => "sessions#destroy"
		get "login" => "sessions#new"

	resources :users
		get "signup" => "users#new"

end
