Rails.application.routes.draw do
  resources :tags
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  resources :images
  resources :documents
  resources :users
  resources :statuses
  resources :departments
	root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
