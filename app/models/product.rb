class Product < ApplicationRecord
  belongs_to :category
  belongs_to :seller

  validates :title, presence: true
end
