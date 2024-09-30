# spec/factories/pets.rb
FactoryBot.define do
  factory :pet do
    name { 'Reese' }
    pet_type { 'rabbit' }
    breed { 'Netherland Dwarf' }
    birthday { '2022-06-17' }
    gotcha_day { '2022-10-21' }
    gender { 'female' }
    # association :user
  end
end

# spec/factories/pets.rb
# FactoryBot.define do
#   factory :newPet do
#     name { 'Miffy' }
#     pet_type { 'rabbit' }
#     breed { 'Lionhead' }
#     birthday { '2023-07-30' }
#     gotcha_day { '2023-11-08' }
#     gender { 'female' }
#     association :user
#   end
# end