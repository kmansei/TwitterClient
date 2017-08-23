Rails.application.routes.draw do
  root 'home#index'
  get 'home/index'
  get '/auth/:provider/callback', to: 'sessions#callback'
  post '/auth/:provider/callback', to: 'sessions#callback'
  get '/logout', to: 'sessions#destroy', as: :logout
  get '/home', to: 'top#timeline', as: :home
  post '/home/tweet', to: 'top#tweet', as: :tweet
end
