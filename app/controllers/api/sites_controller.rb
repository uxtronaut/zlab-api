class Api::SitesController < ApplicationController

  def index
    render json: Site.all
  end

  def show
    render json: Site.find_by(slug: params[:slug])
  end

  def create
    site = Site.new(site_params)

    if site.save
      render json: site, status: :created
      return
    end

    render json: site, status: :bad_request
  end

  def destroy
    site = Site.find_by(slug: params[:slug])

    if site.destroy
      render json: { message: 'ok' }
      return
    end

    render json: { message: 'error' }, status: :bad_request
  end

  protected
  def site_params
    params.require(:site).permit(
      :name
    )
  end

end
