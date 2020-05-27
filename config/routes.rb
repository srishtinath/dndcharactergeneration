Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :jobs, :abilities, :spells
  
  get 'characters/new', to: "character#new", as: 'new_character'
  get 'characters/:id/new_abilities', to: "character#new_abilities", as: 'new_abilities'
  get 'characters/:id/new_spells', to: "character#new_spells", as: 'new_spells'
  post 'characters', to: "character#create"
  patch 'characters/:id/abilities', to: "character#add_abilities"
  patch 'characters/:id/spells', to: "character#add_spells"
  
  get 'characters/:id/edit', to: "character#edit", as: 'edit_character'
  get 'characters/:id/edit_spells', to: "character#edit_spells", as: 'edit_spells'
  get 'characters/:id/edit_abilities', to: "character#edit_abilities", as: 'edit_abilities'
  patch 'characters/:id', to: "character#update"
  patch 'characters/:id/edit_abilities', to: "character#update_abilities"
  patch 'characters/:id/edit_spells', to: "character#update_spells"

end
