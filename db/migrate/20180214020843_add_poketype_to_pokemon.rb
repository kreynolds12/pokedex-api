class AddPoketypeToPokemon < ActiveRecord::Migration[5.1]
  def change
    add_column :pokemons, :poketype, :string
  end
end
