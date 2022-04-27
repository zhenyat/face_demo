Rails.application.routes.draw do
  resources :runs
  resources :trades
  resources :pair_nicknames
  resources :pairs
  resources :coin_nicknames
  resources :coins
  root 'pages#home'
  get 'demo/index', :demo
end
