Rails.application.routes.draw do
  resources :quizzes
  


  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  

  resources :questions
  resources :lessons
  resources :words, :except => [:index]
  
  
  
 get '/words', to: redirect('/')

 resources :quizzes



  


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "lessons#index"

  get "/settings", to: "users#show", as: "settings"

    
    root "words#index"
end