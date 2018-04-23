class PatientController < ApplicationController
  def index
  end

  def show
    @patient = User.find(params[:id])
  end
end
