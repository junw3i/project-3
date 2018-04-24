class DashboardController < ApplicationController
  def index
    # view will depends on role
    if current_user.nil?
       redirect_to new_user_session_path
    else
      @role = current_user.role
      @first_name = current_user.first_name
      if @role == "doctor"
        @patients = User.where(role: 'patient')
      elsif @role == "patient"
        @output = User.find(current_user.id).consult
      end
    end
  end
end
