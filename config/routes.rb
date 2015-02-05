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

      get  '/journal_categories/list', to: "journal_categories#list" 
      get  '/journal_categories/core', to: "journal_categories#core"
      
      #get  '/journal_categories/active' #Gets active mood_categories of the currently authenicated user. - Requires authenication.
      #get '/journal_categories/:name' #Gets an individual mood category by name 
      #todo - endpoint to set journal_category active for particular user

      #post '/moods' #Adds a new mood for the currently authenicated user.  Includes score, note, image. #Requires User Authenication
      #delete /moods/:id #Requires User Authenication.  Must own mood
      #patch '/moods/:id' #Updates an existing mood.  Must own mood

    end
  end


  root 'welcome#index'
end
