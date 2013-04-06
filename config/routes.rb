Pm::Application.routes.draw do
  resources :data

  resources :messages

  authenticated :user do
    root :to    => 'home#index'
  end

  
  root :to      => "home#index"

  match "data"  => "index#fetch_data"

  devise_for :users
  resources :users, :only => [:show, :index]
end
