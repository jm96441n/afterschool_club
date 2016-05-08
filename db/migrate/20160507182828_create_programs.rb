class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
      t.boolean :existing, null: false #whether program is an idea or an actual program
      t.string :loc_name
      t.string :address
      t.string :email
      t.string :phone
      t.string :website
      t.text :description
      t.timestamps null: false
      t.float :lat
      t.float :long
      t.string :name
      t.text :description
    end
  end
end
