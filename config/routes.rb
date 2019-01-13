Rails.application.routes.draw do

  namespace :api do
    resources :sites, param: :slug, only: [
      :index,
      :show,
      :create,
      :destroy
    ] do
      resources :environments, param: :slug, only: [
        :create,
        :update,
        :destroy
      ]
    end
  end

end
