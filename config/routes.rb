Rails.application.routes.draw do

  namespace :api do
    resources :sites, only: [:index, :show, :create, :destroy]
  end

end
