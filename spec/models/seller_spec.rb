require 'rails_helper'

RSpec.describe Seller, type: :model do
  it { is_expected.to belong_to :company }
  it { is_expected.to have_many(:products).dependent(:destroy) }

  it { is_expected.to validate_presence_of :company }
end
