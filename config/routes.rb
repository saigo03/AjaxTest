Rails.application.routes.draw do
  resources :folders do
    resources :memos
  end
  root to: 'folders#index'
end
