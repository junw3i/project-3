class PatientController < ApplicationController
	
  def show
    @patient = User.find(params[:id])
  end

  def video
  	current_req = Request.find_by(user: current_user).id
  	sqlcmd = "SELECT * FROM requests WHERE id < " + current_req.to_s
  	@requests = Request.all
  	@front = Request.find_by_sql(sqlcmd)
  	@vid_path = 'https://demo.mediasoup.org/?roomId=pms' + current_user.id.to_s
  end
end
