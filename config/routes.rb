Rails.application.routes.draw do
  devise_for :users
  resources :projects do
      get :users, on: :collection
      get :assign_user, on: :member
      get :remove_user, on: :member
    resources :bugs do
      get :assign_bug, on: :member
      get :mark_resolved, on: :member
    end
  end

  root "projects#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
