DynamicForms::Engine.routes.draw do
  resources :forms do
    resources :form_responses, as: :responses, path: :responses
  end

  get 'item/:item_type/fields', to: 'item_types#fields',
                                as: :item_fields

  root to: 'forms#index'
end
