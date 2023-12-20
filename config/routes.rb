Rails.application.routes.draw do
  devise_for :users
  
  resources :folders do
    resources :memos
  end
  root to: 'folders#index'
end
