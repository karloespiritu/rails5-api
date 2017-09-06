Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # In our route definition, we're creating todo resource with a
  # nested items resource. This enforces the 1:m (one to many)
  # associations at the routing level.

  resources :todos do
    resources :items
  end

  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'

end
