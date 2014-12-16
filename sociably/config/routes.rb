Socially::Application.routes.draw do

	scope 'api' do
		scope 'v1' do
			use_doorkeeper
		end
	end

	namespace :api, defaults: { format: 'json' } do
		#/api/... Api::
		namespace :v1 do

			#use_doorkeeper

		  resources :topics

		  resources :tags

		  resources :subscriptions

		  resources :users

		  resources :tasks

		  root 'subscriptions#index'

		end
	end

  resources :books do
    resources :chapters
  end

  resources :people
  resources :publishers
  resources :roles
  resources :tags
  resources :tasks
  resources :topics

  devise_for :users, controllers: {confirmations: "confirmations", passwords: "passwords", registrations: "registrations", sessions: "sessions"}

  resources :users do
    resources :subscriptions, except: [:new, :edit], shallow: true
  end

  devise_scope :user do
  	root 'sessions#new'
  end
end
