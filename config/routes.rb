Rails.application.routes.draw do
  use_doorkeeper
  get   '/account', to: 'users#edit', as: :user
  patch '/account', to: 'users#update'
  get   '/login', to: 'sessions#new', as: :login
  post  '/login', to: 'sessions#create'
  get   '/logout', to: 'sessions#destroy', as: :logout
  get   '/signup/complete', to: 'users#complete', as: :users_complete
  get   '/signup', to: 'signup#new', as: :signup
  post  '/signup', to: 'signup#create'
  get   '/password/change/:token', to: 'password_change#show', as: :password_change
  post  '/password/change/:token', to: 'password_change#create'
  get   '/password/reset', to: 'password_reset#show', as: :password_reset
  post  '/password/reset', to: 'password_reset#create'
  get   '/email/confirm/:token', to: 'email_confirmation#show', as: :confirm

  root 'welcome#index'
end
