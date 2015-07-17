Rails.application.routes.draw do
  resources :votes
  root 'votes#index'
end
