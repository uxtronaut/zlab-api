require 'test_helper'

class Api::JobsControllerTest < ActionDispatch::IntegrationTest

  test '#index responds OK with json jobs' do
    create(:job)
    get api_jobs_path
    response.status.must_equal 200
    JSON.parse(response.body)['jobs'].wont_be :empty?
  end

end
