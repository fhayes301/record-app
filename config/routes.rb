Rails.application.routes.draw do
  resources :records do
    resources :songs
  end

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  delete '/logout' => 'sessions#destroy'

  root 'records#index'
end
