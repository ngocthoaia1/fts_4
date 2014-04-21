class Admin::QuestionsController < Admin::ApplicationController
  before_action :load_object, only: [:show, :edit, :update, :destroy]
  
  def index
    @questions = Question.all.paginate page: params[:page], per_page: 15
  end

  def show
  end

  def new
    @question = Question.new
  end

  def edit
  end

  def create
    question = Question.new question_params
    if question.save
      flash[:success] = "Create success!"
    else
      flash[:error] = "Create error!"
    end
    redirect_to admin_question_url question
  end

  def update
    if @question.update_attributes question_params
      flash[:success] = "Update success!"
    else
      flash[:error] = "Update error!"
    end
    redirect_to admin_question_url @question
  end

  def destroy
    @question.destroy
    if @question.destroyed?
      flash[:success] = "Destroy success!"
    else
      flash[:error] = "Destroy error!"
    end
    redirect_to admin_questions_url
  end

  private

    def load_object
      @question = Question.find params[:id]
    end

    def question_params
      params.require(:question).permit(:content, :subject_id,
        answers_attributes: [:id, :content, :correct, :_destroy])
    end
end