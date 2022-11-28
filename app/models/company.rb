class Company < ApplicationRecord
  has_many :users, dependent: :destroy

  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }
end
