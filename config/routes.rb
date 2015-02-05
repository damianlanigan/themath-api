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
    end
  end


  #resource 'moods'

  #post '/moods' #Adds a new mood for the currently authenicated user.  Includes score, note, image. #Requires User Authenication
  #delete /moods/:id #Requires User Authenication.  Must own mood



  #patch '/moods/:id' #Updates an existing mood.  Must own mood

  #TODO - Endpoint to set/save 'user' active categories.
  #get  '/mood_categories/active' #Gets active mood_categories of the currently authenicated user. - Requires authenication.
  #post '/mood_categories/:name' #Gets an individual mood category by name 
  #get  '/mood_categories/base' #Gets 'base categories' - No User authenication
  #get  '/mood_categories' #Gets all mood categories - No User authenication

  root 'welcome#index'
end
