Koala::Application.routes.draw do

  root "site#index"

  resources :users

  resources :chats

  resources :messages, only: ['create']
end
