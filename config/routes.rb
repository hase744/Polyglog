Rails.application.routes.draw do
  devise_for :people
  get 'people/index'
  get 'people/add'
  get 'people/show'
  get 'people/edit'
  post "people/create", to:"people#create"
  get "people/delete/:id", to:"people#delete"
  get "people/edit/:id", to:"people#edit"
  post "people/update/:id", to:"people#update"
  patch "people/update/:id", to:"people#update"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
