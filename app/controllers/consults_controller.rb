class ConsultsController < ApplicationController
	def index
		@consults = Consult.all
	end

	def show
		if (defined?(current_user)).nil?
			redirect_to '/'
		else
			@role = current_user.role
			@consult = Consult.find(params[:id])
			if @role != 'doctor' && current_user.id != @consult.user_id
				redirect_to '/'
			end
		end	
	end

	def new
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
