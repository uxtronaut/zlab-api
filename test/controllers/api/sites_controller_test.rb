require 'test_helper'

class Api::SitesControllerTest < ActionDispatch::IntegrationTest

  it 'response ok with a json sites list' do
    get api_sites_url

    response.status.must_equal 200
    JSON.parse(response.body).keys.must_include 'sites'
  end

  it 'responds ok with a json site' do
    site = create(:site)

    get api_site_url(site)

    response.status.must_equal 200
    JSON.parse(response.body).keys.must_include 'site'
  end

  it 'responds created without errors for valid params' do
    post api_sites_url, params: {
      site: {
        name: Faker::Company.name,
        domain: Faker::Internet.domain_name
      }
    }

    response.status.must_equal 201
    JSON.parse(response.body)['site']['errors'].must_be :nil?
  end

  it 'responds bad_request with errors for invalid params' do
    post api_sites_url, params: { site: { name: '' } }

    response.status.must_equal 400
    JSON.parse(response.body)['site']['errors']['name'].must_be :present?
  end

  it 'destroys sites' do
    site = create(:site)
    site_id = site._id

    delete api_site_url(site)

    response.status.must_equal 200
    Site.find(site_id).must_be :nil?
  end

end
