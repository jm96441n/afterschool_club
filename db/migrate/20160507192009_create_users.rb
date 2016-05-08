class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :first_name, null: false
    	t.string :password_digest
    	t.string :last_name, null: false
    	t.string :email
    	t.string :role

    	t.timestamps null: false
    end
  end
end
