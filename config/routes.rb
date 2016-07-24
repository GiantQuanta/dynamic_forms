DynamicForms::Engine.routes.draw do
  resources :forms

  get 'item/:item_type/fields', to: 'form_items#fields',
                                as: :item_fields

  root to: 'forms#index'
end
