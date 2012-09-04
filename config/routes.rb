MundoTornado::Application.routes.draw do
  scope path_names: { new: "nueva", edit: 'editar' } do
    resources :users, path: 'somos'
    resources :groups, path: 'grupos'
    resources :seeds, path: 'semillero'
    resources :pages, path: 'info'
    resources :chapters, path: 'capitulos' do
      resources :scenes, path: 'escenas'
    end
    resources :characters, path: 'personajes'
    resources :pedias, path: 'enciclopedia'

    resources :sessions, path: 'sesion', only: [:create]
  end

  root to: 'chapters#index'
  get 'registrarse', to: 'users#new', as: 'signup'
  get 'entrar', to: 'sessions#new', as: 'login'
  get 'salir', to: 'sessions#destroy', as: 'logout'
  get 'enter/:id', to: 'sessions#enter', as: :enter
  get 'no-existe', to: 'contents#not_found', as: :notfound
end
