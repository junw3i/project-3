class ConsultsController < ApplicationController

	def show
		if (current_user).nil?
			redirect_to root_path
		else
			@role = current_user.role
			@consult = Consult.find(params[:id])
			if @role != 'doctor' && current_user.id != @consult.user_id
				redirect_to root_path
			end
		end
	end

	def new
		if (current_user).nil?
			redirect_to root_path
		elsif (params[:patient_id]).nil?
			redirect_to root_path
		else
			@patient = User.find(params[:patient_id])
			@user = current_user
			if @user.role != "doctor"
				redirect_to root_path
			end
		end
	end

	def create
 		@consult = Consult.new(consult_params)
  		@consult.save
  		redirect_to @consult
	end

	private
  		def consult_params
    		params.require(:consult).permit(:user_id, :history, :prescription, :mc, :doctor_id)
	  	end
end
