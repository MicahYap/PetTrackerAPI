class Pet < ApplicationRecord
  belongs_to :user
  has_one_attached :vax_card, dependent: :destroy
  has_one_attached :profile_picture, dependent: :destroy
  has_many :vaxs, dependent: :destroy
  has_many :groomers, dependent: :destroy
  has_many :vets, dependent: :destroy
end
