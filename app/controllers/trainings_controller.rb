class TrainingsController < ApplicationController
  def index
    if user_signed_in?
      @training = Training.where(user_id: current_user.id).limit(1).order("created_at DESC")
      if @items.present?
        @data = {'腕筋' => @training.arm , '背筋' => @training.spine, '腹筋' => @training.abs,  '脚筋' =>@training.leg }
      end
    end
  end 
end
