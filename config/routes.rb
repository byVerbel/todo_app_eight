Rails.application.routes.draw do
  namespace :api do
    resources :to_dos, only: [:index, :show, :create, :update, :destroy] do
      member do
        patch :update_completed
      end
    end
  end
end
