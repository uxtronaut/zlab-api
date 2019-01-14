class Cluster
  include Mongoid::Document
  include Mongoid::Timestamps

  include HasSlug

  DEPLOY_TYPE_ESXI = 'esxi'.freeze
  DEPLOY_TYPE_DO = 'digitalocean'.freeze

  field :_id, type: String, default: ->{ SecureRandom.uuid }
  field :slug, type: String
  field :name, type: String
  field :domain, type: String
  field :deploy_target, type: String
  field :deploy_host, type: String

  field :node_count, type: Integer
  field :node_size, type: String
  field :node_cpus, type: Integer
  field :node_memory_gb, type: Integer
  field :node_zpool_drive_size_gb, type: Integer
  field :node_flynn_version, type: String

  field :tls_pin, type: String
  field :private_key, type: String
  field :controller_url, type: String
  field :git_push_url, type: String
  field :docker_push_url, type: String
  field :dashboard_pin, type: String

  field :blob_store_aws_secret_access_key, type: String
  field :blob_store_aws_access_key_id, type: String
  field :blob_store_aws_region, type: String
  field :blob_store_aws_bucket, type: String
end
