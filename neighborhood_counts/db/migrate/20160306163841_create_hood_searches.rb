class CreateHoodSearches < ActiveRecord::Migration
  def change
    create_table :hood_searches do |t|
      t.string :term
      t.integer :manhattan
      t.integer :queens
      t.integer :bronx
      t.integer :brooklyn
      t.integer :staten_island
      t.integer :files

      t.timestamps null: false
    end
  end
end
