Rails.application.routes.draw do
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'rankers#index'

  controller :rankers do
    post 'rankers' => :rankers
  end
end
