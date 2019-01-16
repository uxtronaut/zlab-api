require 'test_helper'

class Api::EnvironmentsControllerTest < ActionDispatch::IntegrationTest

  test '#create responds created with an json environment' do
    site = create(:site)

    post api_site_environments_path(site), params: {
      environment: {
        name: 'staging',
        domain: Faker::Internet.domain_name
      }
    } 

    response.status.must_equal 201
    JSON.parse(response.body)['environment'].wont_be :blank?
  end

  test '#create responds bad request with errors for invalid params' do
    site = create(:site)

    post api_site_environments_path(site), params: {
      environment: {
        name: nil,
        domain: nil
      }
    }

    response.status.must_equal 400
    JSON.parse(response.body)['environment']['errors']['name'].wont_be :blank?
  end

  test '#update' do
    skip 'not implemented'
  end

  test '#destroy' do
    site = create(:site, environments: [build(:environment)])

    delete api_site_environment_path(site, site.environments.first.slug)

    response.status.must_equal 200
  end

end
