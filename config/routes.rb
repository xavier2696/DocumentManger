Rails.application.routes.draw do
  resources :images
  resources :documents
  resources :users
  resources :statuses
  resources :departments
	root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
