Rails.application.routes.draw do
  root 'welcome#index'
  
  get '/sessions/new' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  delete '/sessions' => 'sessions#destroy'

  resources :users do 
    resources :adventures
  end



end
