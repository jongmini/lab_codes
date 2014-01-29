Homeboy::Application.routes.draw do
  
  resources :products, :categories

  # Site Controller
  root "site#index"

  post "/products/:id/edit", to: "products#disconnect"
    
  # get '/products', to: 'products#index'
  # get '/product/:id', to: 'product#show'

  # get '/categories', to: 'categories#index'
  # get '/category/:id', to: 'category#show'


end

#        Prefix Verb   URI Pattern                    Controller#Action
#      products GET    /products(.:format)            products#index
#               POST   /products(.:format)            products#create
#   new_product GET    /products/new(.:format)        products#new
#  edit_product GET    /products/:id/edit(.:format)   products#edit
#       product GET    /products/:id(.:format)        products#show
#               PATCH  /products/:id(.:format)        products#update
#               PUT    /products/:id(.:format)        products#update
#               DELETE /products/:id(.:format)        products#destroy
#    categories GET    /categories(.:format)          categories#index
#               POST   /categories(.:format)          categories#create
#  new_category GET    /categories/new(.:format)      categories#new
# edit_category GET    /categories/:id/edit(.:format) categories#edit
#      category GET    /categories/:id(.:format)      categories#show
#               PATCH  /categories/:id(.:format)      categories#update
#               PUT    /categories/:id(.:format)      categories#update
#               DELETE /categories/:id(.:format)      categories#destroy
#          root GET    /                              site#index
