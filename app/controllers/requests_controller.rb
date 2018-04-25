class RequestsController < ApplicationController
	def create
  		@request = Request.new(request_params)
  		@request.save
  		redirect_to '/patient/video'
	end


	def destroy #I don't understand the routes and REST methods. I used POST to cancel.
  		@request = Request.find_by(request_params)
  		@request.destroy
 
  		redirect_to '/dashboard'
	end

	private
  		def request_params
    		params.require(:request).permit(:user_id)
	  	end
end