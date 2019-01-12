Rails.application.routes.draw do

  namespace :api do
    resources :sites, param: :slug, only: [:index, :show, :create, :destroy]
  end

end
