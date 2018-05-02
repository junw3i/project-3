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
			@vid_path = 'https://demo.mediasoup.org/?roomId=pms' + params[:patient_id].to_s
			@patient = User.find(params[:patient_id])
			@request_data = Request.find_by(user_id: params[:patient_id])
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

		@request = Request.where(user_id: @consult.user_id)
		@request.first.destroy 
		#.first.destroy because WHERE returns am array.
		
		redirect_to dashboard_path
	end

	def api
		@api = Consult.find(params[:id])
		@api.history = nil	
		render json: @api
	end

	private
  		def consult_params
    		params.require(:consult).permit(:user_id, :history, :prescription, :mc_start, :mc_end, :doctor_id)
	  	end
end
