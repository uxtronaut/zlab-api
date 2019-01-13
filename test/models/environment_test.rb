require 'test_helper'

class EnvironmentTest < ActiveSupport::TestCase

  let(:site) {
    build(
      :site,
      environments: [
        build(:environment),
        build(:environment, name: nil, slug: nil, domain: nil)
      ]
    )
  }

  let(:env) { site.environments.first }
  let(:invalid_env) { site.environments.last }

  it 'has a valid factory' do
    env.must_be :valid?
  end

  it 'requires a name' do
    invalid_env.must_be :invalid?
    invalid_env.errors[:name].wont_be :empty?
  end

  it 'must have a unique name per parent' do
    env2 = site.environments.build(name: env.name, domain: Faker::Internet.domain_name)
    env2.must_be :invalid?
    env2.errors[:name].wont_be :empty?
  end

  test 'it scopes unique name/slug to parent' do
    s1 = create(
      :site,
      environments: [{ name: 'staging', domain: Faker::Internet.domain_name }]
    )
    s2 = create(
      :site,
      environments: [{ name: 'staging', domain: Faker::Internet.domain_name }]
    )

    s1.must_be :persisted?
    s2.must_be :persisted?
  end
end
