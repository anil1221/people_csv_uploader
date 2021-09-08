Rails.application.routes.draw do
  root to: 'home#index'
  post '/upload_csv', to: 'home#upload_csv'
  post '/create', to: 'home#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
