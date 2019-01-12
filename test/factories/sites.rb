FactoryBot.define do
  factory :site do
    slug { Faker::Internet.slug.gsub(/_/, '-') }
    name { Faker::Company.name }
    domain { Faker::Internet.domain_name }
    published_at { Time.now }
    saved_at { Time.now }
    favicon { 'favicon.ico' }
  end
end
