Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "posts#index"

  resources :posts do
      resources :comments
  end

  get ':petname', to: 'profiles#show', as: :profile
  get ':petname/edit', to: 'profiles#edit', as: :edit_profile
  patch ':petname/edit', to: "profiles#update", as: :update_profile
end
