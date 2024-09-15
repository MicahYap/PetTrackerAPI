class Pet < ApplicationRecord
  belongs_to :user
  has_one_attached :vax_card
  has_one_attached :profile_picture
  has_many :vaxs, dependent: :destroy
end
