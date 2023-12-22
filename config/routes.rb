Rails.application.routes.draw do
  devise_for :users
  
  resources :folders do
    resources :memos
  end

  resources :mission
  root to: 'folders#index'
end
