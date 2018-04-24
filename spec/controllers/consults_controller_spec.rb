require 'rails_helper'

RSpec.describe ConsultsController, type: :controller do
  context 'GET #show' do
    it 'returns a redirect (not signed in)' do
      patient = User.create!(
        first_name: "junwei",
        last_name: "chan",
        email: "test@gmail.com",
        password: "111111",
        gender: "Male",
        id_number: "888888888",
        mobile: "88888888"
      )

      doctor = User.create!(
        first_name: "junwei",
        last_name: "chan",
        email: "test2@gmail.com",
        password: "111111",
        gender: "Male",
        id_number: "888888888",
        mobile: "88888888",
        role: "doctor"
      )

      consult = Consult.create!(
        user_id: patient.id,
        history: "vomit",
        prescription: "pandaol",
        mc: "2",
        doctor_id: doctor.id
      )

      get :show, params: {id: consult.id}
      # expect(response).to be_success
      expect(response).to redirect_to("/")
    end
  end
end
