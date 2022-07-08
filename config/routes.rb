Rails.application.routes.draw do
  devise_for :users
  get '/urls' => 'urls#index'
  get '/:short_url' => 'urls#redirect'
  root :to => "urls#index"
  resources :urls, only: [:index, :new, :create, :destroy]
  get '*path', to: 'urls#not_found'

end


