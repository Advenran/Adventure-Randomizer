Rails.application.routes.draw do
  root 'welcome#index'
  
  get '/sessions/new' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  delete '/sessions' => 'sessions#destroy'

  post '/users/:user_id/prev_adventures/new' => 'prev_adventures#create'


  resources :users do 
    resources :adventures
    resources :prev_adventures
  end



end
