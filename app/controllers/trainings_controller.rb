class TrainingsController < ApplicationController
  def index
    @training = Training.all
  end
end
