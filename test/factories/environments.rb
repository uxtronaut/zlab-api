FactoryBot.define do
  factory :environment do
    slug { Faker::Internet.slug.gsub(/_/, '-') }
    name { Faker::Company.name }
    domain { Faker::Internet.domain_name }
  end
end
