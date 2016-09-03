Rails.application.routes.draw do
  resources :game_rounds, only: [:create, :show, :destroy] do
    resources :hits, only: [:create]
  end

  root 'welcome#index'
end
