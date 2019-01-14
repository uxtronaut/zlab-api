class ClusterSerializer < ActiveModel::Serializer
  include HasSerializedErrors

  attributes(
    :id,
    :slug,
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
    :tls_pin,
    :private_key,
    :controller_url,
    :git_push_url,
    :docker_push_url,
    :dashboard_pin,
    :blob_store_aws_secret_access_key,
    :blob_store_aws_access_key_id,
    :blob_store_aws_region,
    :blob_store_aws_bucket,
    :errors
  )
end
