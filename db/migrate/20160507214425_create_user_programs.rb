class CreateUserPrograms < ActiveRecord::Migration
  def change
    create_table :user_programs do |t|
    	t.references :users
    	t.references :programs

    	t.timestamps, null: false
    end
  end
end
