class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
      t.boolean :existing, null: false #whether program is an idea or an actual program
      t.boolean :approved, null: false
      t.string :address, null: false
      t.timestamps null: false
      t.string :agency
      t.string :phone
      t.string :boro
      t.float :lat
      t.float :long

    end
  end
end
