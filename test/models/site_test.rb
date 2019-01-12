require 'test_helper'

describe Site do
  let(:site) { build(:site) }
  let(:invalid_site) { build(:site, name: nil, slug: nil, domain: nil) }

  it 'has a valid factory' do
    site.must_be :valid?
  end

  it 'requires a name, slug, and domain' do
    invalid_site.must_be :invalid?

    [:name, :slug, :domain].each do |attr|
      invalid_site.errors[attr].wont_be :empty?
    end
  end

  it 'requires a unique name, slug, and domain' do
    site.save!

    [:name, :slug, :domain].each do |attr|
      duplicate_site = build(:site, attr => site.send(attr))
      duplicate_site.must_be :invalid?
      duplicate_site.errors[attr].wont_be :empty?
    end
  end
end
