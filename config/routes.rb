Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  root to: 'homes#top'
  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    resources :users, only: [:show]  do
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end
    
    get 'users_info/edit' => 'users#edit',as: 'edit_users'
    patch 'users_info/edit' => 'users#update'
    post 'user/confirm' => 'users#confirm'
    patch 'user/hide' => 'users#hide'
    resources :events, only: [:index, :show] do
      resources :reviews, only: [:index, :create]
    end
    resources :venues, only: [:index, :show] do
      resources :reviews, only: [:index, :create]
    end
    resources :artists, only: [:index, :show] 
    get 'search' => 'searchs#search'
  end
  
  namespace :admins do
    resources :events
    resources :users, except: [:new, :destroy, :create]
    resources :venues
    resources :artists
    get 'search' => 'searchs#search'
  end
end
