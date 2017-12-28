Rails.application.routes.draw do
  get 'todos/index'

  get 'welcome/index'
  get 'todos/done'
  mount Ckeditor::Engine => '/ckeditor'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'welcome#index'
  resources :journals
  resources :articles do
      resources :comments
  end
  resources :users
  resources :welcome
  resources :todos
end
