class PatientController < ApplicationController
	
  def show
    @patient = User.find(params[:id])
  end

  def video
  	@vid_path = 'https://demo.mediasoup.org/?roomId=pms' + current_user.id.to_s
  end
end
