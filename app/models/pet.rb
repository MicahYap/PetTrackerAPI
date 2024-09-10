class Pet < ApplicationRecord
  belongs_to :user
  has_one_attached :vax_card
end
