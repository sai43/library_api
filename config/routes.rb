Rails.application.routes.draw do

  resources :users 
  resources :books 
  resources :libraries
  
  resources :libraries do 
    resources :books do 
      resource :users
    end
  end

  root "libraries#index"
end
