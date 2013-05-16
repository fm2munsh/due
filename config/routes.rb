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
<<<<<<< HEAD
	resources :sessions, only: [:new, :create, :destroy]
	resources :posts, only: [:new, :delete]

=======
	resources :sessions # not sure why?
	resources :posts, only: [:new, :delete] do
		collection do
			match "/ajaxnew" => "posts#ajaxnew"
		end
	end
>>>>>>> d351cb8ca833c66f87ce05ea2e77d1debbdb1cbf
	match "signup" => "users#new", as: "signup"
	match "logout" => "sessions#destroy", as: "logout"
	match "login" => "sessions#new", as: "login"

end