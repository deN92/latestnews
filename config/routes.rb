Rails.application.routes.draw do

  root 'categories#index'

  # resources :categories, :path => ''
  resources :categories, :path => '' do
    resources :subcategories, :path => ''
  end

  resources :categories, :path => '' do
    resources :articles
  end

end
