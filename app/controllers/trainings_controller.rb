class TrainingsController < ApplicationController
  def index
    if user_signed_in?
    range=Range.new(Time.zone.today, Time.zone.today.tomorrow)
    @arm = Training.where(created_at: range).sum(:arm)
    binding.pry
    
    end
    # if user_signed_in?
    #   @arm = Training.find(created_at: today).sum(:arm)
    #   @data = {'腕筋' => @training.arm , '背筋' => @training.spine, '腹筋' => @training.abs,  '脚筋' =>@training.leg }
    # end
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