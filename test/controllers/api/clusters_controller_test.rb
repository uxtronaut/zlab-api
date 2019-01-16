require 'test_helper'

class Api::ClustersControllerTest < ActionDispatch::IntegrationTest

  test '#create responds created and calls the deploy job' do
    Deploy::Esxi::FlynnClusterJob.expects(:perform_later).once

    post api_clusters_path, params: {
      cluster: attributes_for(:cluster)
    }

    response.status.must_equal 201
  end

end
