class CreateProgramtags < ActiveRecord::Migration
  def change
    create_table :programtags do |t|
      t.belongs_to :program, null: false, index: true
      t.belongs_to :tag, null: false, index: true
      t.timestamps null: false
    end
  end
end
