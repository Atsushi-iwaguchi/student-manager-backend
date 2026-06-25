class ExamResult < ApplicationRecord
    belongs_to :exam

    validates :subject, presence: true
    validates :score, presence: true, numericality: { only_integer: greater_than_or_equal_to: 0 }
    
end
