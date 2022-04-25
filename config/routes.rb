Rails.application.routes.draw do
  resources :coins
  root 'pages#home'
  get 'demo/index', :demo
end
