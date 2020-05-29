Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :jobs, :abilities, :spells, :character_abilities, :character_spells, :characters
  resources :users
  
  root 'users#hello'

  get 'characters/:id/stats', to: "characters#stats", as: 'stats'
  patch 'characters/:id', to: "characters#stats_update", as: 'stats_update'

  delete 'character_abilities', to: "character_abilities#delete_all", as: 'delete_abilities'
  delete 'character_spells', to: "character_spells#delete_all", as: 'delete_spells'

  get '/login' => 'sessions#new', as: 'login'
  post '/login' => 'sessions#create', as: 'login_user'
  post '/logout' => 'sessions#destroy'
  post '/new_character' => 'sessions#clear_character'


end
