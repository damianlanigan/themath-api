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


  namespace :api do
    namespace :v1 do
      post "signup", to: "signup#create"
      get "me", to: "users#me"

      get  'journal_categories', to: "journal_categories#index"

      scope '/users' do
        scope 'self/' do

          post 'journal_entry', to: 'journal_entries#create'
          get  'journal_entries/:id', to: 'journal_entries#show'
          delete 'journal_entries/:id', to: 'journal_entries#destroy'
          #patch 'journal_entries/:id', to: 'journal_entries#update'
          #put   'journal_entries/:id', to: 'journal_entries#update'

        end
      end

    end
  end


  root 'welcome#index'
end
