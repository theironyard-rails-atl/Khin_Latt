Rails.application.routes.draw do
  resources :games
  # Essentially:
  # get  '/games'          => 'games#index'
  # get  '/games/:id'      => 'games#show'
  # post  '/games'          => 'games#create'
  # patch '/games/:id'      => 'games#update'
  # get  '/games/new'      => 'games#new'
  # get  '/games/:id/edit' => 'games#edit'
  # delete '/games/:id'    => 'games#destroy'
  # w/ slightly different URL helpers

  # so we don't need to do these anymore: get '/games' => 'games#index'
end
