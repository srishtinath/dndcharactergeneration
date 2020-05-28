Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :jobs, :abilities, :spells, :character_abilities, :character_spells, :characters
  resources :users

  get 'characters/:id/stats', to: "characters#stats", as: 'stats'
  patch 'characters/:id', to: "characters#stats_update", as: 'stats_update'

  delete 'character_abilities', to: "character_abilities#delete_all", as: 'delete_abilities'
  delete 'character_spells', to: "character_spells#delete_all", as: 'delete_spells'

  root 'sessions#hello'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

end
