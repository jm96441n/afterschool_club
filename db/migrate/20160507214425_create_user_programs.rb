class CreateUserPrograms < ActiveRecord::Migration
  def change
    create_table :user_programs do |t|
    	t.references :user
    	t.references :program

    	t.timestamps null: false
    end
  end
end
