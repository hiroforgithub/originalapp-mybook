Rails.application.routes.draw do
  devise_for :users
  # get 'books/index'
  root to: "books#home"
  resources :books do
    resources :likes, only: [:create, :destroy]
    member do 
      get "categoryNovel"
      get "categoryHoby"
      get "home"
    end  
  end  
end
