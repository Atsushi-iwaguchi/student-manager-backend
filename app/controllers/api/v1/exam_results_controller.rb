class Api::V1::ExamResultsController < ApplicationController
  before_action :authenticate_user!
  before action :set_exam_result, only: [:update, :destroy]

  def create
    exam = Exam.find(params[:exam_id])
    exam_result = exam.exam_results.build(exam_result_params)

    if exam_result.save
      render json: exam_result status: :create
    else
      render json: { errors: exam_result.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @exam_result.update(exam_result_params)
      render json: @exam_result
    end
  end

  def destroy
    @exam_result.destroy
    render json: { message: '削除しました' }
  end

  private
  def set_exam_result
    @exam_result = ExamResult.find(params[:id])
  end

  def exam_result_params
    params.require(:exam_result).permit(:subject, :score, :deviation)
  end
end
