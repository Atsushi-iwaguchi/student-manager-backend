class Api::V1::ExamsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_exam, only: [:show, :destroy]

  def index
    if current_user.teacher?
      exams = Exam.all.includes(:user, :exam_results)
    else
      exams = current_user.exams.includes(:exam_results)
    end
    render json: exams, include: { exam_results: {} }
  end

  def create
    if current_user.teacher?
      student = User.find(params[:student_id])
    else
      student = current_user
    end

    exam = student.exams.build(exam_params)

    if exam.save
      render json: exam, status: :created
    else
      render json: { error: exam.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    render json: @exam, include: { exam_results: {} }
  end

  def destroy
    @exam.destroy
    render json: { message: '削除しました' }
  end

  private
  def set_exam
    @exam = Exam.find(params[:id])
  end

  def exam_params
    params.require(:exam).permit(:exam_name, :exam_date)
  end
end
