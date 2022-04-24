Rails.application.routes.draw do
  root 'pages#home'
  get 'demo/index', :demo
end
