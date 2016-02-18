class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.string :name
      t.string :code

      t.timestamps null: false
    end
    add_index :states, :code, unique: true
  end
end
