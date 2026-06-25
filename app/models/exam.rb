class Exam < ApplicationRecord
    belongs_to :user
    has_many :exam_results, dependent: :destroy

    validates :exam_name, presence: true
    validates :exam_date, presence: true
end
