Spree::Core::Engine.routes.draw do
  namespace :admin do
    resources :store_locators, except: :show
  end

  resources :store_locators, only: [:index, :show], path: :store_locator
end

