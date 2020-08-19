class TrainingsController < ApplicationController
  def index
    @training = Training.where(user_id: current_user.id).limit(1).order("created_at DESC")
  end
end
