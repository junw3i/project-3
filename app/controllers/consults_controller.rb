class ConsultsController < ApplicationController
	def index
		@consults = Consult.all
	end

	def show
		@consult = Consult.find(params[:id])
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
