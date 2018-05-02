class DashboardController < ApplicationController
  def create_appointment
    user_appointment = User.find(current_user.id)  
    user_appointment.appointment_date = params[:appointment][:appointment_date]
    user_appointment.save
    redirect_to dashboard_path
  end

  def index




    # view will depends on role
    if current_user.nil?
      redirect_to new_user_session_path
    else
      #Getting queue details
      @queue = Request.all

      @in_queue = @queue.any? { |req| req[:user_id] == current_user.id }
      if @in_queue
        current_req = Request.find_by(user: current_user).id
        sqlcmd = "SELECT * FROM requests WHERE id < " + current_req.to_s
        @front = Request.find_by_sql(sqlcmd)
      end
      
      @role = current_user.role
      @first_name = current_user.first_name
      if @role == "doctor"
        @patients = User.where(role: 'patient').order(first_name: :asc)
      elsif @role == "patient"
        @output = User.find(current_user.id).consult.order(created_at: :desc)
        @in_queue = @queue.any? { |req| req[:user_id] == current_user.id }
      end
    end
  end
	private
  		def appointment_params
    		params.require(:appointment).permit(:user_id, :appointment_date)
	  	end

end
