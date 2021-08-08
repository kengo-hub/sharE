Rails.application.routes.draw do
  root to: 'homes#top'
  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    resource :users, only: [:show]
    get 'users_info/edit' => 'users#edit',as: 'edit_users'
    patch 'users_info/edit' => 'users#update'
    post 'user/confirm' => 'users#confirm'
    patch 'user/hide' => 'users#hide'
    resources :events, only: [:index, :show]
    resources :venues, only: [:index, :show]
    resources :artists, only: [:index, :show]
    get 'search' => 'searchs#search'
  end
  
  namespace :admins do
    resources :events
    resources :users, except: [:new, :destroy, :create]
    resources :genres, except: [:new, :show]
    resources :items
    get 'search' => 'searchs#search'
  end
  devise_for :admins
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
