# frozen_string_literal: true

Rails.application.routes.draw do # rubocop:todo Metrics/BlockLength
  namespace :api do
    namespace :v1 do
      resources :tutorials, only: %i[show index]
      resources :videos, only: [:show]
    end
  end

  root 'welcome#index'
  get 'tags/:tag', to: 'welcome#index', as: :tag
  get '/register', to: 'users#new'
  get '/users/:id/activate', to: 'activate#update'
  get '/users/activated', to: 'activate#show'

  namespace :admin do
    get '/dashboard', to: 'dashboard#show'
    resources :tutorials, only: %i[create edit update destroy new] do
      resources :videos, only: [:create]
    end
    resources :videos, only: %i[edit update destroy]

    namespace :api do
      namespace :v1 do
        put 'tutorial_sequencer/:tutorial_id', to: 'tutorial_sequencer#update'
      end
    end
  end

  namespace :user do
    resources :friends, only: [:create]
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/dashboard', to: 'users#show'
  get '/about', to: 'about#show'
  get '/get_started', to: 'get_started#show'
  get '/auth/github', as: :github_login
  get '/auth/github/callback', to: 'github#create'

  # Is this being used?
  get '/video', to: 'video#show'

  resources :users, only: %i[new create update edit]
  resources :bookmarks, only: [:create]

  resources :tutorials, only: %i[show index] do
    resources :videos, only: %i[show index]
  end

  resources :user_videos, only: %i[create destroy]
end
