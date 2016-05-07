class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.belongs_to :user, null: false, index: true
      t.belongs_to :program, null: false, index: true
      t.timestamps null: false
    end
  end
end
