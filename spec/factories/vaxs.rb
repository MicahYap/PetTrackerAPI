# spec/factories/users.rb
FactoryBot.define do
  factory :vax do
    calendar { '2022-06-17' }
    vet { 'MEVC' }
    vaccine { 'anti-rabies' }
    next_visit { '2023-06-17' }
  end
end
