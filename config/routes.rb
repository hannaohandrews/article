Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "articles#index"
  get "/articles", to: "articles#index"
  # the route above declares that Get/articles requests are mapped to the index action of ArticlesController (app/controllers/articles_controller.rb)
  get "/articles/:id", to: "articles#show"
  #another get route but it has :id. This is a dynamic segment. This designates a route parameter. The value of :id will be captured and made available to the show action of ArticlesController.

  resources :articles
end
