class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.belongs_to :user
      t.belongs_to :program
      t.timestamps null: false
    end
  end
end
