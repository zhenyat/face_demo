Rails.application.routes.draw do
  resources :pairs
  resources :coin_nicknames
  resources :coins
  root 'pages#home'
  get 'demo/index', :demo
end
