class Seller < User
  belongs_to :company, dependent: :destroy
  has_many :products, dependent: :destroy

  validates :company, presence: true
end
