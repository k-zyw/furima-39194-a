FactoryBot.define do
  factory :item do
    text {Faker::Lorem.sentence}
    image {Faker::Lorem.sentence}
    association :user  #users.rbのFactoryBotとアソシエーションがあることを意味する。
    
  end
end
