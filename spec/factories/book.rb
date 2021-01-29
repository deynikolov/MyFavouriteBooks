FactoryBot.define do
    factory :book do
      title { 'A Fake Title' }
      genre { 'Drama' }
      publish_date { 60.years.ago }
    end
  end
