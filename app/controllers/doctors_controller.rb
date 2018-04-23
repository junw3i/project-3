class DoctorsController < ApplicationController
  def index
    role = current_user.role
    if role != "doctor"
      redirect_to root_path
    end

    @patients = User.where(role: 'patient')
  end
end
