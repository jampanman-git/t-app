class TrainingsController < ApplicationController
  def index
    range=Range.new(Time.zone.today, Time.zone.today.tomorrow)
    @trainings = Training.where(created_at: range, user_id: current_user.id)
    @data = {'腕筋' => @trainings.sum(:arm) , '背筋' => @trainings.sum(:spine), '腹筋' => @trainings.sum(:abs),  '脚筋' => @trainings.sum(:leg)}
  end 

  def new
    @training = Training.new
  end

  def create
    @training = Training.new(training_params)
    if @training.save
      render :create
    else
      render :new
    end
  end

  private

  def training_params
    params.require(:training).permit(:arm, :spine, :abs, :leg).merge(user_id: current_user.id)
  end
end