Rails.application.routes.draw do
  
  get "login" => "users#login_form"
  get "sign_up" => "users#new" 
  
  post "users/:id/update" => "users#update"
  get "users/:id/edit" => "users#edit"
  post "users/create" => "users#create"
  get "users/:id" => "users#show"
 
  get "rooms" => "roooms#index"

  get "/" => "home#top"
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
