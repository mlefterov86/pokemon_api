class AddExternalIdToType < ActiveRecord::Migration[6.1]
  def change
    add_column :types, :external_id, :integer
    add_index :types, :external_id
  end
end
