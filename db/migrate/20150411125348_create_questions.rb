class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :question
      t.string :answer_1
      t.string :answer_2
      t.string :answer_3
      t.string :answer_4
      t.string :answer_5

      t.timestamps null: false
    end
  end
end
