Rails.application.routes.draw do
  get 'books/index' => "books#index"
  
  post 'users/create' => "users#create"
  post 'users/logout'  => 'users#logout'
  post 'users/login'  => 'users#login'
  get 'users/signup' => "users#signup"
  get 'users/login_form'  => "users#login_form"
  get 'users/show/:id'  => "users#show"
  get '/' => "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
