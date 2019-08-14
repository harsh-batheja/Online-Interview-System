class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.text :question
      t.string :qtype
      t.integer :duration,default: 0
      t.integer :correct,default: 1
      t.integer :incorrect,default: -1
      t.integer :unattempted,default: 0
      t.references :paper, foreign_key: true
      t.timestamps
    end
  end
end
