require 'date'
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

		if @consult.mc_start == '' || @consult.mc_end == ''
			mc = 0
		else
			start_date = DateTime.parse(@consult.mc_start)
			end_date = DateTime.parse(@consult.mc_end)
			mc = (end_date - start_date).ceil
		end

		@consult.mc = mc
		@consult.save
		redirect_to dashboard_path
	end

	private
  		def consult_params
    		params.require(:consult).permit(:user_id, :history, :prescription, :mc_start, :mc_end, :doctor_id)
	  	end
end
