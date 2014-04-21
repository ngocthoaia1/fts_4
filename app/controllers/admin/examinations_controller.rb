class Admin::ExaminationsController < Admin::ApplicationController
  before_action :load_object, only: [:show, :edit, :update, :destroy]

  def index
    @examinations = Examination.all.paginate page: params[:page], per_page: 15
  end

  def show
  end

  def new
    @examination = Examination.new
  end

  def edit
  end

  def create
    examination = Examination.new examination_params
    if examination.save
      flash[:success] = "Create success!"
    else
      flash[:error] = "Create error!"
    end
    redirect_to admin_examinations_url
  end

  def update
    if @examination.update_attributes examination_params
      flash[:success] = "Update success!"
    else
      flash[:error] = "Update error!"
    end
    redirect_to admin_examinations_url
  end

  def destroy
    @examination.destroy
    flash[:success] = "Destroy success!"
    redirect_to admin_examinations_url
  end

  private

    def examination_params
      params.require(:examination).permit(:subject_id, :name, :total_questions, :time_limit)
    end

    def load_object
      @examination = Examination.find params[:id]
    end
end
