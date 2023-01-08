class AddReferenceCompanyToProduct < ActiveRecord::Migration[7.0]
  def change
    add_reference :products, :company, foreign_key: { to_table: :companies }
  end
end
