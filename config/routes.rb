Rails.application.routes.draw do
  # resources :pokemons
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

		 namespace :api do
		  namespace :v1 do
		   resources :pokemons
		  end
		 end
end