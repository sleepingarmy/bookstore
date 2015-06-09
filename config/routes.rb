Rails.application.routes.draw do

  namespace :admin do
    get '/' => 'base#index'
    resources :books
  end

  root 'public#index'
end
