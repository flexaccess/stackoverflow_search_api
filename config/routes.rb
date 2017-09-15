Rails.application.routes.draw do

	namespace :api, defaults: {format: 'json'}  do
		namespace :v1 do
			resources :search
		end
	end

	root 'main#index'
	resources :main
end
