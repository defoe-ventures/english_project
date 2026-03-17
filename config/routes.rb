Rails.application.routes.draw do


  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  

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

    
    root "users#show"
end