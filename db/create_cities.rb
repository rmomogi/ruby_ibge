class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name
      t.integer :ibge_code
      t.references :state, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :cities, :ibge_code, unique: true
  end
end
