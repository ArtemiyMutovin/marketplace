class AddReferenceCompanyToProduct < ActiveRecord::Migration[7.0]
  def change
    add_reference :products, :company, foreign_key: true , index: true
  end
end
