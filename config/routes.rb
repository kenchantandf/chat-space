Rails.application.routes.draw do
  devise_for :users
  root 'groups#index'
  resources :users, only: %i(edit update) do
    collection do
      get 'search'
    end
  end
  resources :groups, except: %i(show destroy) do
    resources :messages, only: %i(index create)
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
