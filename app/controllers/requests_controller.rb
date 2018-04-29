class RequestsController < ApplicationController
	def create
		@request = Request.new(request_params)
			# byebug
			if @request.save
				queue_number = Request.all.size
				flash[:notice] = "You are in queue number " + queue_number.to_s
			else
				flash[:notice] = "You are already in the queue for consultation"
			end
		redirect_to patient_video_path
	end


	def destroy #I don't understand the routes and REST methods. I used POST to cancel.
		@request = Request.find_by(request_params) || "nil"
		unless @request == "nil"
			@request.destroy
				flash[:notice] = "Consultation request cancelled"
		end
		redirect_to '/dashboard'
	end

	private
		def request_params
			params.require(:request).permit(:user_id, :description)
		end
end
