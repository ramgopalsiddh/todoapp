# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  # GET /about
  get "about", to: "about#index"
     # change  route url but don't change file name
  # get "about-us", to: "about#index", as: :about
  get "todo", to: "todo#index"

  get "sign_up", to:"registrations#new"
  post "sign_up", to:"registrations#create"

  # root route 
  # these are all three type can we define root route
    # Defines the root path route ("/")
  # get "/", to:"main#index"
  # get "", to:"main#index"
    # root "articles#index"
  root to:"main#index"

end
