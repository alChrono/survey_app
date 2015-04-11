class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.references :survey, index: true
      t.references :question, index: true

      t.timestamps null: false
    end
  end
end
