Rails.application.routes.draw do
  post 'authenticate', to: 'authentication#authenticate'
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :groups do
    resources :messages
  end
end
