require 'test_helper'

class ClusterTest < ActiveSupport::TestCase

  let(:cluster) { build(:cluster) }
  let (:complete_cluster) { build(:complete_cluster) }

  it 'has a valid factory' do
    cluster.must_be :valid?
  end

  it 'has a valid complete factory' do
    complete_cluster.must_be :valid?
  end

end
