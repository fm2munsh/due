Due::Application.routes.draw do
	resources :home
		root :to 		=> 'home#index'
		match '/' 		=> 'home#index'

	resources :groups do
		member do
			match "/join" => 'groups#join'
		end
	end
	resources :users
	resources :sessions # not sure why?
	resources :posts, only: [:new, :delete] do
		collection do
			match "/ajaxnew" => "posts#ajaxnew"
		end
	end
	match "signup" => "users#new", as: "signup"
	match "logout" => "sessions#destroy", as: "logout"
	match "login" => "sessions#new", as: "login"
end