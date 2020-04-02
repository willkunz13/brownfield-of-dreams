# frozen_string_literal: true

FactoryBot.define do
  factory :tutorial do
    title { Faker::Name.unique.name }
    description { Faker::Movies::HitchhikersGuideToTheGalaxy.marvin_quote }
    url = '/assets/uploads/2011/03/puppy-development-460x306.jpg'
    thumbnail { "http://cdn3-www.dogtime.com#{url}" }
    playlist_id { Faker::Crypto.md5 }
    classroom { false }
  end
end
