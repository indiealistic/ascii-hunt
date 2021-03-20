Rails.application.routes.draw do

  root :to => 'pages#home'

  # Main routes
  resources :users # ADD `, :only => [:new, :create, :index]` to this once tested to limit ability for users to input into database
  resources :beets # gets all available routes for Beets
  resources :comments # gets all available routes for Comments
  resources :likes # gets all available routes for Likes

  delete '/' => 'likes#destroy'

  post '/' => 'pages#clipboard'

  # Login feature
  get '/login' => 'session#new' # login form
  post '/login' => 'session#create' # process the login
  delete '/login' => 'session#destroy' # log out

end
