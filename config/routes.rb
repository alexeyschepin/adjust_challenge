Rails.application.routes.draw do
  resources :repos

  root 'repos#index'
end
