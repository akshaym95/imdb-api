Rails.application.routes.draw do
  resources :movies do
  post 'search_movie' , on: :collection
  get 'search_result' , on: :collection
  end
end
