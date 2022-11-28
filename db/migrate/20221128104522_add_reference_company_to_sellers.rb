class AddReferenceCompanyToSellers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :company, foreign_key: { to_table: :companies }
  end
end
