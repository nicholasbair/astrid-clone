Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :registrations => "users/registrations" }

  root 'welcome#index'

  resources :users, :only => [] do
    resources :lists
    resources :tasks
  end

  get 'users/most_completed_tasks', to: 'users/users#most_completed_tasks'
end
