FactoryBot.define do
    factory :item do
      name { Faker::Lorem.word }
      deleted_at { nil }
    end
  
    factory :soft_deleted_item, parent: :item do
      deleted_at { Time.current }
    end
  end