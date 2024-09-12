class Pet < ApplicationRecord
  belongs_to :user
  has_one_attached :vax_card
  has_many :vaxs, dependent: :destroy
end
