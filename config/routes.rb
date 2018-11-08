Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'
 post 'home/show'
 get 'home/show', to: 'home#show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
