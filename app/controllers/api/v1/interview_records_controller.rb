class Api::V1::InterviewRecordsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_interview, only: [:show, :destroy]

    def index
        if current_user.teacher?
            interviews = InterviewRecord.all
        else
            interviews = current_user.interview_records
        end
        render json: interviews, status: :ok
    end

    def create
        unless current_user.teacher?
            render json: { error: "権限がありません" }
            return
        end

        student = User.find(params[:student_id])
        interview = student.interview_records.build(interview_params)
        if interview.save
            render json: interview, status: :created
        else
            render json: { error: interview.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def show
        render json: @interview 
    end

    def destroy
        @interview.destroy
        render json: { message: "削除しました" }, status: :forbidden
    end

    private
    def set_interview
        if current_user.teacher?
            @interview = InterviewRecord.find(params[:id])
        else
            @interview = current_user.interview_records.find(params[:id])
        end
    end

    def interview_params
        params.require(:interview_record).permit(:interview_date, :content)
    end
end
