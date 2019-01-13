class Api::EnvironmentsController < ApplicationController

  before_action :find_site

  def create
    environment = @site.environments.build(environment_params)

    if environment.save
      render json: environment, status: :created
      return
    end

    render json: environment, status: :bad_request
  end

  def destroy
    environment = @site.environments.find_by(slug: params[:slug])

    if environment.destroy
      render json: { message: 'ok' }
      return
    end

    render json: { message: 'error' }, status: :bad_request
  end

  private
  def environment_params
    params.require(:environment).permit(
      :name,
      :domain
    )
  end

  def find_site
    @site = Site.find_by(slug: params[:site_slug])
  end
end
