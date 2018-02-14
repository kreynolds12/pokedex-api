class CreatePokemons < ActiveRecord::Migration[5.1]
  def change
    create_table :pokemons do |t|
      t.integer :number
      t.string :title
      t.string :type
      t.string :image
      t.string :gender
      t.string :slug

      t.timestamps
    end
  end
end
