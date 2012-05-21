Pubhub::Application.routes.draw do
  scope path_names: { new: "nueva", edit: 'editar' } do
    resources :users, path: 'somos'
    resources :groups, path: 'grupos'
    resources :seeds, path: 'semillero'

    resources :sessions, path: 'sesion', only: [:create]
  end

  root to: 'seeds#index'
  get 'registrarse', to: 'users#new', as: 'signup'
  get 'entrar', to: 'sessions#new', as: 'login'
  get 'salir', to: 'sessions#destroy', as: 'logout'
  get 'enter', to: 'sessions#enter', as: :enter
end
