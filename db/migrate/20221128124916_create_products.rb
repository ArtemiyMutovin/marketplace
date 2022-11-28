class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.references :category, foreign_key: true, index: true

      t.timestamps
    end
  end
end
