class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher

  validates :password, length: { minimum: 6, message: 'must be more than 6 characters' }, if: :password_required?
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  has_many :pets, dependent: :destroy

  private

  def password_required?
    !persisted? || !password.nil? || !password_confirmation.nil?
  end
end
