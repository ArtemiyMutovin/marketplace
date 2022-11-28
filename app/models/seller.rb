class Seller < User
  belongs_to :company, dependent: :destroy

  validates :company, presence: true
end
