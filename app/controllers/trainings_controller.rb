class TrainingsController < ApplicationController
  def index
    if user_signed_in?
      range=Range.new(Time.zone.today, Time.zone.today.tomorrow)
      @trainings = Training.where(created_at: range, user_id: current_user.id)
      @data = {'腕筋' => @trainings.sum(:arm) , '背筋' => @trainings.sum(:spine), '腹筋' => @trainings.sum(:abs),  '脚筋' => @trainings.sum(:leg)}

      range2=Range.new(Time.zone.today.ago(6.days),Time.zone.tomorrow)
      @trainings2 = Training.where(created_at: range2, user_id: current_user.id)
      @data2 = {'腕筋' => @trainings2.sum(:arm) , '背筋' => @trainings2.sum(:spine), '腹筋' => @trainings2.sum(:abs),  '脚筋' => @trainings2.sum(:leg)}
      

      range3=Range.new(Time.zone.today,Time.zone.tomorrow)
      @trainings3 = Training.where(created_at: range3,user_id: current_user.id)
      @total1 = @trainings3.sum(:arm) + @trainings3.sum(:spine) + @trainings3.sum(:abs) + @trainings3.sum(:leg)

      range4=Range.new(Time.zone.today.ago(1.days),Time.zone.today)
      @trainings4 = Training.where(created_at: range4,user_id: current_user.id)
      @total2 = @trainings4.sum(:arm) + @trainings4.sum(:spine) + @trainings4.sum(:abs) + @trainings4.sum(:leg)

      range5=Range.new(Time.zone.today.ago(2.days),Time.zone.today.ago(1.days))
      @trainings5 = Training.where(created_at: range5,user_id: current_user.id)
      @total3 = @trainings5.sum(:arm) + @trainings5.sum(:spine) + @trainings5.sum(:abs) + @trainings5.sum(:leg)

      range6=Range.new(Time.zone.today.ago(3.days),Time.zone.today.ago(2.days))
      @trainings6 = Training.where(created_at: range6,user_id: current_user.id)
      @total4 = @trainings6.sum(:arm) + @trainings6.sum(:spine) + @trainings6.sum(:abs) + @trainings6.sum(:leg)

      range7=Range.new(Time.zone.today.ago(4.days),Time.zone.today.ago(3.days))
      @trainings7 = Training.where(created_at: range7,user_id: current_user.id)
      @total5 = @trainings7.sum(:arm) + @trainings7.sum(:spine) + @trainings7.sum(:abs) + @trainings7.sum(:leg)

      range8=Range.new(Time.zone.today.ago(5.days),Time.zone.today.ago(4.days))
      @trainings8 = Training.where(created_at: range8,user_id: current_user.id)
      @total6 = @trainings8.sum(:arm) + @trainings8.sum(:spine) + @trainings8.sum(:abs) + @trainings8.sum(:leg)

      range9=Range.new(Time.zone.today.ago(6.days),Time.zone.today.ago(5.days))
      @trainings9 = Training.where(created_at: range9,user_id: current_user.id)
      @total7 = @trainings9.sum(:arm) + @trainings9.sum(:spine) + @trainings9.sum(:abs) + @trainings9.sum(:leg)
      
      @data3 = {Time.zone.today.ago(6.days).strftime('%Y年%m月%d日') => @total7,Time.zone.today.ago(5.days).strftime('%Y年%m月%d日') => @total6,
                Time.zone.today.ago(4.days).strftime('%Y年%m月%d日') => @total5,Time.zone.today.ago(3.days).strftime('%Y年%m月%d日') => @total4,
                Time.zone.today.ago(2.days).strftime('%Y年%m月%d日') => @total3,Time.zone.today.ago(1.days).strftime('%Y年%m月%d日') => @total2,
                Time.zone.today.strftime('%Y年%m月%d日') => @total1 }

      @test = Follow.where(created_at: range,foller_id: current_user.id)
      binding.pry
    end
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