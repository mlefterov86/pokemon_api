class AddExternalIdToPokemon < ActiveRecord::Migration[6.1]
  def change
    add_column :pokemons, :external_id, :integer
    add_index :pokemons, :external_id
  end
end
