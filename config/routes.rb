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
      get  'journal_categories/core', to: "journal_categories#core"

      scope '/users' do
        scope 'self/' do

          put  'journal_categories', to: "user_journal_categories#update"
          get  'journal_categories', to: 'user_journal_categories#index'

          post 'mood', to: 'moods#create'
          get  'moods/:id', to: 'moods#show'
          delete 'moods/:id', to: 'moods#destroy'
          patch 'moods/:id', to: 'moods#update'
          put   'moods/:id', to: 'moods#update'

        end
      end

    end
  end


  root 'welcome#index'
end
