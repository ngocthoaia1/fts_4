class AnswerSheetsController < ApplicationController

  before_action :load_object, only: [:show, :edit, :update]

  def show

  end

  def new

  end

  def edit
  end

  def create
    examination = Examination.find params[:examination_id]
    answer_sheet = AnswerSheet.create_answer_sheet examination, current_user
    redirect_to edit_examination_answer_sheet_url(examination, answer_sheet)
  end

  def update
    if @answer_sheet.update_attributes answer_sheet_params
      flash[:success] = "You finished this examination!"
    else
      flash[:error] = "Can't submit!"
    end
    redirect_to examination_answer_sheet_url(@examination, @answer_sheet)
  end

  private

    def load_object
      @examination = Examination.find params[:examination_id]
      @answer_sheet = AnswerSheet.find params[:id]
    end

    def answer_sheet_params
      params.require(:answer_sheet).permit(
        answer_sheet_details_attributes: [:id, :answer_id])
    end
end