require 'test_helper'

class SiteTest < ActiveSupport::TestCase
  let(:site) { build(:site) }
  let(:invalid_site) { build(:site, name: nil, slug: nil) }

  it 'has a valid factory' do
    site.must_be :valid?
  end

  it 'requires a name, slug' do
    invalid_site.must_be :invalid?

    [:slug, :name].each do |attr|
      invalid_site.errors[attr].wont_be :empty?
    end
  end

  it 'requires a unique name' do
    site.save!

    duplicate_site = build(:site, name: site.name)
    duplicate_site.must_be :invalid?
    duplicate_site.errors[:name].wont_be :empty?
  end

  it 'requires a unique slug' do
    site.save!

    duplicate_site = build(:site, name: site.name)
    duplicate_site.save.must_equal false
    duplicate_site.errors[:slug].wont_be :empty?
  end

  it 'generates a slug from the name' do
    site.slug = nil
    site.save
    site.slug.must_be :present?
  end
end
