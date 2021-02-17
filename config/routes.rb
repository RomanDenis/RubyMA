Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  mount Blog::API => '/'
  resources :posts  , only: %i[index show]
  get '/users' => 'users#index'
end
