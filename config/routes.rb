Pubhub::Application.routes.draw do
  root to: 'publications#index'
  resources :users, path: 'somos'
  resources :publications, path: 'publicaciones'

  resources :sessions, path: 'sesion', only: [:create]
  get 'registrarse', to: 'users#new', as: 'signup'
  get 'entrar', to: 'sessions#new', as: 'login'
  get 'salir', to: 'sessions#destroy', as: 'logout'
end
