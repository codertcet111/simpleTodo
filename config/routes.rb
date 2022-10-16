Rails.application.routes.draw do
  #Configuring the todo list index action as root to show on land page for our application
  root "todo_lists#index"

  resources :todo_lists
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
