class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.text :question
      t.string :type
      t.integer :duration,default: 0
      t.integer :correct
      t.integer :incorrect
      t.integer :unattempted
      t.references :paper, foreign_key: true
      t.timestamps
    end
  end
end
