Rails.application.routes.draw do
  devise_for :users
  root :to => "urls#index"
  get '/urls' => 'urls#index'
  get '/:short_url' => 'urls#redirect'

  resources :urls, only: [:index, :new, :create, :destroy, :edit, :update]
  get '*path', to: 'urls#not_found'

end


