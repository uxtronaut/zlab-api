FactoryBot.define do
  factory :job do
    name { "#{Faker::Name.last_name} Job" }
    started_at { Time.now - rand(5).minutes }
  end

  factory :finished_job, parent: :job do
    finished_at { Time.now }
    log { Faker::Lorem.paragraphs(5) }
  end

  factory :errored_job, parent: :job do
    errored_at { Time.now }
    log { Faker::Lorem.paragraphs(5) }
  end
end
