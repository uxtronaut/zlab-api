FactoryBot.define do
  factory :cluster do
    name { Faker::Name.first_name }
    domain { Faker::Internet.domain_name }
    deploy_target { [:esxi, :digitalocean].sample }
    deploy_host { Faker::Internet.domain_name }
    node_count { [1, 2, 3].sample }
    node_size { ['8gb', '12gb'].sample }
    node_cpus { 4 }
    node_memory_gb { 8 }
    node_zpool_drive_size_gb { 100 }
    node_flynn_version { 'v20190115.0' }
    blob_store_aws_secret_access_key { Faker::Internet.password(128) }
    blob_store_aws_access_key_id { Faker::Internet.password(12) }
    blob_store_aws_region { 'us-west-2' }
    blob_store_aws_bucket { Faker::Internet.domain_name }
  end

  factory :complete_cluster, parent: :cluster do
    tls_pin { Faker::Internet.password(64) }
    private_key { Faker::Internet.password(64) }
    controller_url { Faker::Internet.url }
    git_push_url { Faker::Internet.url }
    docker_push_url { Faker::Internet.url }
    dashboard_pin { Faker::Internet.password(64) }
  end
end
