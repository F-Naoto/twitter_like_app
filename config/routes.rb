Rails.application.routes.draw do
  get 'rooms/show', to:'rooms#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#top'
  resources :users do
    resource :relationships, only:%i[create destroy]
  end
  resources :posts do
    resource :reviews, only:%i[create]
    resource :favorites, only:%i[create destroy]
    resource :comments, only:%i[show create destroy]
  end
  get '/login', to:'sessions#new'
  post '/login', to:'sessions#create'
  delete '/logout', to:'sessions#destroy'
end
