Rails.application.routes.draw do
  resources :users
  resources :votes
  get 'get_votes', to: 'votes#get_votes'
  root 'votes#index'
end
