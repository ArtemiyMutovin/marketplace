class Company < ApplicationRecord
  has_many :products, dependent: :destroy
  has_many :sellers, dependent: :destroy

  accepts_nested_attributes_for :sellers

  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }
end
