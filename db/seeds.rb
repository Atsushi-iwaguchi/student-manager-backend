# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# 既存データを削除
ExamResult.destroy_all
Exam.destroy_all
User.destroy_all

# 講師ユーザー
teacher = User.create!(
  name: "山田先生",
  email: "teacher@example.com",
  password: "password123",
  password_confirmation: "password123",
  role: "teacher"
)

# 生徒ユーザー1
student1 = User.create!(
  name: "田中太郎",
  email: "student1@example.com",
  password: "password123",
  password_confirmation: "password123",
  role: "student",
  target_school: "○○大学",
  grade: "高校3年"
)

# 生徒ユーザー2
student2 = User.create!(
  name: "佐藤花子",
  email: "student2@example.com",
  password: "password123",
  password_confirmation: "password123",
  role: "student",
  target_school: "△△大学",
  grade: "高校2年"
)

# 田中太郎の模試データ
exam1 = student1.exams.create!(
  exam_name: "第1回全国模試",
  exam_date: "2026-04-01"
)

exam1.exam_results.create!([
  { subject: "数学", score: 80, deviation: 58.5 },
  { subject: "英語", score: 70, deviation: 55.0 },
  { subject: "国語", score: 90, deviation: 62.0 },
])

exam2 = student1.exams.create!(
  exam_name: "第2回全国模試",
  exam_date: "2026-06-01"
)

exam2.exam_results.create!([
  { subject: "数学", score: 85, deviation: 60.0 },
  { subject: "英語", score: 75, deviation: 57.0 },
  { subject: "国語", score: 88, deviation: 61.0 },
])

# 佐藤花子の模試データ
exam3 = student2.exams.create!(
  exam_name: "第1回全国模試",
  exam_date: "2026-04-01"
)

exam3.exam_results.create!([
  { subject: "数学", score: 65, deviation: 50.0 },
  { subject: "英語", score: 80, deviation: 58.0 },
  { subject: "国語", score: 75, deviation: 55.0 },
])

puts "seeds完了"