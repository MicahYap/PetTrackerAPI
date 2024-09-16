class Groomer < ApplicationRecord
  belongs_to :pet
  validates :calendar, presence: true
  validates :groomer, presence: true
  validates :next_visit, presence: true
end
