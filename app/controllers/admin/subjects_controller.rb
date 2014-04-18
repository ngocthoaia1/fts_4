class Admin::SubjectsController < Admin::ApplicationController
  before_action :load_object, only: [:show, :edit, :update, :destroy]

  def index
    @subjects = Subject.all.paginate page: params[:page], per_page: 15
  end

  def show
  end

  def new
    @subject = Subject.new
  end

  def edit
  end

  def create
    subject = Subject.new subject_params
    if subject.save
      flash[:success] = "Create #{subject.name} finished!"
    else
      flash[:error] = "Can't save"
    end
    redirect_to admin_subjects_url
  end

  def update
    if @subject.update_attributes subject_params
      flash[:success] = "Update #{@subject.name} finished!"
    else
      flash[:error] = "Update failed!"
    end
    redirect_to admin_subjects_url
  end

  def destroy
    @subject.destroy
    flash[:success] = "Subject: #{@subject.name} destroyed."
    redirect_to admin_subjects_url
  end

  private

    def load_object
      @subject = Subject.find params[:id]
    end

    def subject_params
      params.require(:subject).permit(:name)
    end
end