class Api::ClustersController < ApplicationController

  def index
    render json: Cluster.all
  end

  def show
    render json: Cluster.find_by(:slug)
  end

  def create
    cluster = Cluster.new(init_cluster_params)

    if cluster.save
      Deploy::Esxi::FlynnClusterJob.perform_later(cluster.id)

      render json: cluster, status: :created
      return
    end

    render json: cluster, status: :bad_request
  end

  def update
    cluster = Cluster.find_by(slug: params[:slug])

    if cluster.update(cluster_config_params)
      render json: cluster
      return
    end

    render json: cluster, status: :bad_request
  end

  def destroy
    cluster = Cluster.find_by(slug: params[:slug])

    if cluster.destroy
      render json: { message: 'ok' }
      return
    end

    render json: { message: 'error' }, status: :bad_request
  end

  private
  def init_cluster_params
    params.require(:cluster).permit(
      :name,
      :domain,
      :deploy_target,
      :deploy_host,
      :node_count,
      :node_size,
      :node_cpus,
      :node_memory_gb,
      :node_zpool_drive_size_gb,
      :node_flynn_version,
      :blob_store_aws_secret_access_key,
      :blob_store_aws_access_key_id,
      :blob_store_aws_region,
      :blob_store_aws_bucket
    )
  end

  def cluster_config_params
    params.require(:cluster).permit(
      :tls_pin,
      :private_key,
      :controller_url,
      :git_push_url,
      :docker_push_url,
      :dashboard_pin
    )
  end
end
