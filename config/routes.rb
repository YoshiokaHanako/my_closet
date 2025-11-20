Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root "homes#top"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'my_page', to: 'users#show', as: 'my_page'
end
