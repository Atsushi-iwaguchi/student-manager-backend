class CreateInterviewRecords < ActiveRecord::Migration[8.1]
  def change
    create_table :interview_records do |t|
      t.timestamps
      t.references :user, null: false, foreign_key: true
      t.date :interview_date, null: false
      t.text :content, null: false
    end
  end
end
