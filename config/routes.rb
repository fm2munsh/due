Due::Application.routes.draw do
	resources :home
		root :to 		=> 'home#index'
		match '/' 		=> 'home#index'

	resources :groups do
		member do
			match "/join" => 'groups#join'
		end
		collection do
			match "/create" => "groups#create"
		end
	end
	match "/g/:name" => "groups#show_by_name"
	resources :users
	resources :sessions, only: [:new, :create, :destroy]

	resources :posts do
		collection do
			match "/create" => "posts#create"
		end
	end
	resources :tags do

		collection do
			match "/create" => "tags#create"
		end
	end
	match "signup" => "users#new", as: "signup"
	match "logout" => "sessions#destroy", as: "logout"
	match "login" => "sessions#new", as: "login"

end