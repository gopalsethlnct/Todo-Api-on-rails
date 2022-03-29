Rails.application.routes.draw do
  devise_for :users, :controllers => {registrations: "users"}
  resources :users, :task_todos do
        resources :sub_tasks
  end
  
    
  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
