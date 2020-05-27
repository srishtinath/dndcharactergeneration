Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :jobs, :abilities, :spells
  
  get 'characters', to: "characters#index", as: 'characters'

  get 'characters/:id/new_abilities', to: "characters#new_abilities", as: 'new_abilities'
  get 'characters/:id/new_spells', to: "characters#new_spells", as: 'new_spells'
  post 'characters', to: "characters#create"
  patch 'characters/:id/abilities', to: "characters#add_abilities"
  patch 'characters/:id/spells', to: "characters#add_spells"
  get 'characters/new', to: "characters#new", as: 'new_character'
  
  get 'characters/:id/edit', to: "characters#edit", as: 'edit_character'
  get 'characters/:id/edit_spells', to: "characters#edit_spells", as: 'edit_spells'
  get 'characters/:id/edit_abilities', to: "characters#edit_abilities", as: 'edit_abilities'
  patch 'characters/:id', to: "characters#update"
  patch 'characters/:id/edit_abilities', to: "characters#update_abilities"
  patch 'characters/:id/edit_spells', to: "characters#update_spells"

end
