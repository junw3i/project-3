class DashboardController < ApplicationController
  def index

    #Getting queue details
    @queue_size = Request.all.size
    @first_in_line = Request.all.first

    # view will depends on role
    if current_user.nil?
       redirect_to new_user_session_path
    else
      @role = current_user.role
      @first_name = current_user.first_name
      if @role == "doctor"
        @patients = User.where(role: 'patient').order(first_name: :asc)
      elsif @role == "patient"
        @output = User.find(current_user.id).consult.order(created_at: :desc)
      end
    end
  end
end
