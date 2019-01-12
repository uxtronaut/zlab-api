Rails.application.routes.draw do

  namespace :api do
    resources :sites, only: [:index, :create, :destroy]
  end

end
