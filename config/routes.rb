Rails.application.routes.draw do
  get 'books/index' => "books#index"
  post 'books/add' => "books#create"
  post 'books/destroy/:id'  => 'books#destroy'
  post 'users/create' => "users#create"
  post 'users/logout'  => 'users#logout'
  post 'users/login'  => 'users#login'
  get 'users/signup' => "users#signup"
  get 'users/login_form'  => "users#login_form"
  post 'users/update/:id'  => 'users#update'
  get 'users/edit/:id'  => "users#edit"
  get 'users/show/:id'  => "users#show"
  get '/' => "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'posts/index' => "posts#index"
  get 'posts/create_form/:id' => "posts#create_form"
  post 'posts/create/:id'  => 'posts#create'
  
end
