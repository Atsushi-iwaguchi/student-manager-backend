class InterviewRecord < ApplicationRecord
    belongs_to :user

    validates :interview_date, presence: true
    validates :content, presence:true
end
