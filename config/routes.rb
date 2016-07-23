DynamicForms::Engine.routes.draw do
  resources :forms

  root to: 'forms#index'
end
