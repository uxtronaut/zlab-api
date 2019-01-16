require 'test_helper'

class HealthcheckTest < ActionDispatch::IntegrationTest

  it 'responds ok' do
    get '/healthcheck'
    response.status.must_equal 200
  end

end
