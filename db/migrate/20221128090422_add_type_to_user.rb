class AddTypeToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :type, :string, null: false, default: 'User'
    add_index :users, :type
  end
end
