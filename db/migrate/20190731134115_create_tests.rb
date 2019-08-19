class CreateTests < ActiveRecord::Migration[5.2]
  def change
    create_table :tests do |t|
      t.references :paper, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :marks,default: 0

      t.timestamps
    end
  end
end
