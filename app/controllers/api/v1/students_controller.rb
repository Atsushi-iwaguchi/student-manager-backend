class Api::V1::StudentsController < ApplicationController
  def index
    if current_user.teacher?
      students = User.where(role: :student) #roleがstudentを全員取得
      render json: students
    else
      render json: { error: '権限がありません' }, status: :forbidden
    end
  end

  def show
    if current_user.teacher?
      student = User.find(params[:id])
    elsif current_user.id == params[:id].to_i
      student = current_user
    else
      render json: { error: '権限がありません' }, status: :forbidden
    end
    render json: student
  end
end
