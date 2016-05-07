class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :first_name, null: false
    	t.string :last_name, null: false
    	t.string :user_name, null: false
    	t.string :ref_id, null: false
    	t.string :type
    	t.string :email
    	t.string :hmhco_response

    	t.timestamps null: false
    end
  end
end
