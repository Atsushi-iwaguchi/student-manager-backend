class User < ApplicationRecord
    has_secure_password
    validates :email, presence: true, uniqueness: true
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :password, length: { minimum: 6 }, if: -> { new_record? || !password.nil? }

    enum :role, { student: 0, teacher: 1 }

    has_many :exams, dependent: :destroy
    has_many :exam_results, through: :exams
    has_many :interview_records, dependent: :destroy

    # JWTトークン用にユーザー情報をペイロードに変換
    def to_token_payload
        {
            sub: id,
            email: email,
            role: role,
            exp: 24.hours.from_now.to_i #有効期限
        }
    end

end
