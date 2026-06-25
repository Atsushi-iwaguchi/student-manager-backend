class CreateExams < ActiveRecord::Migration[8.1]
  def change
    create_table :exams do |t|
      t.timestamps
      t.references :user, null: false, foreign_key: true
      t.date :exam_date
      t.string :exam_name
    end
  end
end
