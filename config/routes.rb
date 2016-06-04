Rails.application.routes.draw do



  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root 'categories#index'

  resources :comments do 
    member do 
      put "like" => "comments#upvote"
      put "dislike" => "comments#downvote"
    end
  end
  # resources :stats
  get 'stats/exchange', to: 'stats#exchange'

  resources :users, except: "index" do
    resources :blogs
  end

  resources :blogs
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
