class CreateOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :options do |t|
      t.string :answer
      t.integer :position
      t.boolean :is_correct
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
