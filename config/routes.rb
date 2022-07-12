Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/projects', to: 'project#index', as: 'project'
  get '/todos', to: 'todo#index'

  post '/projects', to: 'project#create'
  post '/todos', to: 'todo#create'

  patch '/projects/:id/todo/:todoId', to: 'todo#update'
end
