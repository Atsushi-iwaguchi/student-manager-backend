class CreateExamResults < ActiveRecord::Migration[8.1]
  def change
    create_table :exam_results do |t|
      t.timestamps
      t.references :exam, null: false, foreign_key: true
      t.string :subject
      t.integer :score
      t.float :deviation
    end
  end
end
