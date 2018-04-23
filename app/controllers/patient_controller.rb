class PatientController < ApplicationController

	def index
  	if (defined?(current_user)).nil?
			redirect_to '/'
		else
  			@output = User.find(current_user.id).consult
  			@first_name = current_user.first_name
  	end
  end

  def show
    @patient = User.find(params[:id])
  end
  
end
