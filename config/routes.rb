Rails.application.routes.draw do
  devise_for :people
  get 'messages/index'
  get 'messages/add/:id', to:'messages#add'
  get 'messages/:id', to:'messages#show'
  get 'messages/edit'
  post "messages/create", to:"messages#create"
  post "messages/update/:id", to:"messages#update"
  patch "messages/update/:id", to:"messages#update"
  get "messages/delete/:id", to:"messages#delete"

  get 'people/index'
  get 'people/add'
  get 'people/:id', to:'people#show'
  get 'people/edit'
  post "people/create", to:"people#create"
  get "people/delete/:id", to:"people#delete"
  get "people/edit_profile/:id", to:"people#edit_profile"
  post "people/update/:id", to:"people#update"
  patch "people/update/:id", to:"people#update"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
