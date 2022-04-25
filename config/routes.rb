Rails.application.routes.draw do
  resources :coin_nicknames
  resources :coins
  root 'pages#home'
  get 'demo/index', :demo
end
