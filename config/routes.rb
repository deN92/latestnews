Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root 'categories#index'

  resources :categories, :path => '' do
    resources :subcategories, :path => ''
  end

  resources :categories, :path => '' do
    resources :articles
  end

  resources :articles do
  	resources :comments
  end

end
