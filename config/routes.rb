Rails.application.routes.draw do

  namespace :admin do
    get '/' => 'base#index'

    get '/login' => 'sessions#new'
    post '/login' => 'sessions#create'
    delete '/login' => 'sessions#destroy'

    resources :books
  end

  root 'public#index'
end
