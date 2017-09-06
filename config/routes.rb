Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # In our route definition, we're creating todo resource with a
  # nested items resource. This enforces the 1:m (one to many)
  # associations at the routing level.

  # module the controllers without affecting the URI
  # Remember: non-default versions have to be defined
  # above the default version.
  scope module: :v2, constraints: ApiVersion.new('v2') do
    resources :todos, only: :index
  end

  # namespace the controllers without affecting the URI
  scope module: :v1, constraints: ApiVersion.new('v1', true) do
    resources :todos do
      resources :items
    end
  end

  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'

end
