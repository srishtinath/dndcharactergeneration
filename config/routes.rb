Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :jobs, :abilities, :spells, :character_abilities, :character_spells, :characters
  
  get 'characters/:id/stats', to: "characters#stats", as: 'stats'
  patch 'characters/:id', to: "characters#stats_update", as: 'stats_update'

end
