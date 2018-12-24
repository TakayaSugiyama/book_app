Rails.application.routes.draw do
  get 'users/show'
  get '/' => "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
