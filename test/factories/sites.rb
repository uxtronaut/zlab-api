FactoryBot.define do
  factory :site do
    slug { Faker::Internet.slug.gsub(/_/, '-') }
    name { Faker::Company.name }
  end
end
