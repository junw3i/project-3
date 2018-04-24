class DoctorsController < ApplicationController
  def index
    if (current_user).nil?
       redirect_to root_path
    else
      role = current_user.role
      if role != "doctor"
        redirect_to root_path
      end
      @patients = User.where(role: 'patient')
    end

  end
end
