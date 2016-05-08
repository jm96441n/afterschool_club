class CreateAttenders < ActiveRecord::Migration
  def change
    create_table :attenders do |t|
    	t.belongs_to :user
    	t.belongs_to :program
      t.timestamps null: false
    end
  end
end
