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

  devise_for :users, controllers: {confirmations: "confirmations", passwords: "passwords", registrations: "registrations", sessions: "sessions"}
  resources :topics

  resources :tags

#  resources :subscriptions

  resources :users do
  	resources :subscriptions, except: [:new, :edit], shallow: true
  end

  resources :tasks

  resources :books do
  	resources :chapters
  end

  devise_scope :user do
  	root 'sessions#new'
  end

  resources :roles

  resources :people


end