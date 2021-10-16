Rails.application.routes.draw do
  namespace :public do
    get 'notifications/index'
  end
  devise_for :admins
  devise_for :users
  root to: 'homes#top'
  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    resources :users, only: [:show]  do
      resource :relationships, only: %i[create destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end
    resources :messages, only: [:create]
    resources :rooms, only: %i[create show]
    get 'users_info/edit' => 'users#edit', as: 'edit_users'
    patch 'users_info/edit' => 'users#update'
    post 'user/confirm' => 'users#confirm'
    patch 'user/hide' => 'users#hide'
    resources :events, only: %i[index show] do
      resources :event_reviews, only: %i[index create destroy] do
        resources :event_comments, only: %i[create destroy]
      end
    end
    resources :venues, only: %i[index show] do
      member do
        get 'venue_events', to: 'venues#venue_events'
      end
      resources :venue_reviews, only: %i[index create destroy] do
        resources :venue_comments, only: %i[create destroy]
      end
    end
    resources :artists, only: %i[index show]
    resources :notifications, only: %i[index update]
    get 'search' => 'searchs#search'
  end

  namespace :admins do
    resources :events
    resources :users, except: %i[new destroy create]
    resources :venues
    resources :artists
    get 'search' => 'searchs#search'
  end
end
