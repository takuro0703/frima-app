Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
  }
  devise_scope :user do 
    get 'address', to: 'users/registrations#new_address'
    post 'address', to: 'users/registrations#create_address'
    get 'confirmation', to: 'users/registrations#new_confirmation'
    post 'confirmation', to: 'users/registrations#create_confirmation'
  end
  root to: 'items#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :items, only: [:index, :show]
end
