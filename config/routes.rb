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

    resources :clusters, param: :slug, only: [
      :index,
      :show,
      :create,
      :update,
      :destroy
    ]

    resources :jobs, only: [
      :index,
      :show
    ]
  end

  get '/healthcheck', to: proc { [
    200,
    { 'Content-Type' => 'application/json' },
    [{ status: 'ok' }.to_json]
  ] }

end
