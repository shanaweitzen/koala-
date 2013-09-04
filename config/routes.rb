Koala::Application.routes.draw do

  #Registration
  get 'register', to: 'registrants#new', as: :register #form

  post 'register', to: 'registrants#create' #this runs when you click button on the form- related to DB

  get 'register/:code', to: 'registrants#edit', as: :registration # 

  delete 'register/:code', to: 'registrants#destroy' #use later

  #Authentication

  #Users 
  get 'users/new', to: 'users#new', as: :new #get the form for sign up

  get 'users/:id/edit', to: 'users#edit', as: :edit

  get '/user/:id', to: 'users#show', as: :user

  put 'users/:id', to: 'users#update', as:"update"

  delete '/users/:id', to:'users#destroy', as:"delete"

  resources :users

  resources :chats

  resources :messages, only: ['create']

#Login

 get '/sessions/new', to: 'sessions#new', as:'login'   

#Logout

 delete '/sessions/:id', to:'sessions#destroy', as:'logout'      

 root "site#index" 

  
end


 # get   'register' => "registrant#new", as: :register
 #  post  'register' => 'registrant#create'

 #  #Complete registration
 #  get   'register/:code' => 'registrant#edit', as: :registration_complete
 #  put   'register/:code' => 'registrant#update'

 #  # Login
 #  get     'login'  => 'sessions#new', as: :login
 #  post    'login'  => 'sessions#create'

 #  # Logout
 #  # get     'logout' => 'sessions#destroy'
 #  delete  'logout' => 'sessions#destroy', as: :logout



 #  resources :users do
 #    resources :messages 
 #  end 


