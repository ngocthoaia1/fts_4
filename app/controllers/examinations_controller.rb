class ExaminationsController < Admin::ApplicationController
  before_action :load_object, only: [:show, :edit, :update, :destroy]

  def index
    @examinations = Examination.all.paginate page: params[:page], per_page: 15
  end

  def show
  end

  private

    def load_object
      @examination = Examination.find params[:id]
    end
end
