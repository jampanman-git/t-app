class TrainingsController < ApplicationController
  def index
    range=Range.new(Time.zone.today, Time.zone.today.tomorrow)
    @trainings = Training.where(created_at: range, user_id: current_user.id)
    @data = {'腕筋' => @trainings.sum(:arm) , '背筋' => @trainings.sum(:spine), '腹筋' => @trainings.sum(:abs),  '脚筋' => @trainings.sum(:leg)}

    range_second=Range.new(Time.zone.today.ago(6.days),Time.zone.tomorrow)
    @trainings2 = Training.where(created_at: range_second, user_id: current_user.id)
    @data2 = {'腕筋' => @trainings2.sum(:arm) , '背筋' => @trainings2.sum(:spine), '腹筋' => @trainings2.sum(:abs),  '脚筋' => @trainings2.sum(:leg)}
    
    @trainings3 = Training.where(created_at: range_second, user_id: current_user.id)
    @data3 = {Time.zone.today.ago(6.days).strftime('%Y年%m月%d日') => 111,Time.zone.today.ago(5.days).strftime('%Y年%m月%d日') => 111,
              Time.zone.today.ago(4.days).strftime('%Y年%m月%d日') => 111,Time.zone.today.ago(3.days).strftime('%Y年%m月%d日') => 111,
              Time.zone.today.ago(2.days).strftime('%Y年%m月%d日') => 111,Time.zone.today.ago(1.days).strftime('%Y年%m月%d日') => 111,
              Time.zone.today.strftime('%Y年%m月%d日') => 222 }
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