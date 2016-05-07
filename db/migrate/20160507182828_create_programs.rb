class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
      t.bool :actual, null: false #whether program is an idea or an actual program
      t.string :address
      t.timestamps null: false
    end
  end
end
