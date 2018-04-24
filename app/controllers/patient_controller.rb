class PatientController < ApplicationController
	
  def show
    @patient = User.find(params[:id])
  end

end
