Rails.application.routes.draw do


  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  # get 'users', to: "users#index"

  get 'students', to: "students#index"
  

  resources :questions
  resources :lessons
  resources :words
    
#  get '/words', to: redirect('/')

 resources :quizzes#, :except => [:index]
#  get '/quizzes', to: redirect('/')



  


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "lessons#index"

  # get "/settings", to: "users#show", as: "settings"

  root to: redirect('/language_practice')

  get 'language_practice', to: 'users#show'#, as: 'language_practice'
  

  # This catches EVERYTHING else and redirects to root
  match "*path", to: redirect("/"), via: :all
  
end