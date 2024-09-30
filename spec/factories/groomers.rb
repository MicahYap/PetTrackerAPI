FactoryBot.define do
  factory :groomer do
    calendar { '2022-06-17' }
    groomer { 'VIP' }
    next_visit { '2022-10-21' }
    association :pet
  end
end