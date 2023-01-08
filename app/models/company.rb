class Company < ApplicationRecord
  has_many :products, dependent: :destroy
  has_many :sellers, dependent: :destroy

  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }
end
