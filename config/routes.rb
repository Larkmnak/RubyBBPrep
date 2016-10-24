Rails.application.routes.draw do
  root 'users#home'

  get '/ideas' => 'ideas#home'
  get '/ideas/new'
  post '/ideas/create'

  post '/users/new'
  post '/users/login'
  get '/users/logout'

  get '/users/:id' => 'users#show'
  get '/ideas/:id' => 'ideas#show'
  post '/ideas/:id/like' => 'ideas#like'
  post '/ideas/:id/add' => 'ideas#add'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end