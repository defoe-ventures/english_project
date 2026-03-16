Rails.application.routes.draw do
  get 'students', to: 'students#index'
  get 'students/new', to: 'students#new'
  get 'students/show/:id', to: 'students#show'
  get 'students/edit/:id', to: 'students#edit'
  post 'students', to: 'students#create'
  put 'students/update/:id', to: 'students#update'
  get 'students/destroy', to: 'students#destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "students#index"
end
