Rails.application.routes.draw do
  resources :votes
  get 'get_votes', to: 'votes#get_votes'
  root 'votes#index'
end
