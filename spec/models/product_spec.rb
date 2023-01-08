require 'rails_helper'

RSpec.describe Product, type: :model do
  it { is_expected.to belong_to :category }
  it { is_expected.to belong_to :company }
  it { is_expected.to belong_to :seller }

  it { is_expected.to validate_presence_of :title }
end
