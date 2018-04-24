require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do
    it "ensure successful new sign up" do
      user = User.new(
        first_name: "junwei",
        last_name: "chan",
        email: "test@gmail.com",
        password: "111111",
        gender: "Male",
        id_number: "888888888",
        mobile: "88888888"
      ).save
      expect(user).to eq(true)
    end

    it "ensure first_name presence" do
      user = User.new(
        last_name: "chan",
        email: "test@gmail.com",
        password: "111111",
        gender: "Male",
        id_number: "888888888",
        mobile: "88888888"
      ).save
      expect(user).to eq(false)
    end

    it "ensure last_name presence" do
      user = User.new(
        first_name: "junwei",
        email: "test@gmail.com",
        password: "111111",
        gender: "Male",
        id_number: "888888888",
        mobile: "88888888"
      ).save
      expect(user).to eq(false)
    end

    it "ensure email presence" do
      user = User.new(
        first_name: "junwei",
        last_name: "chan",
        password: "111111",
        gender: "Male",
        id_number: "888888888",
        mobile: "88888888"
      ).save
      expect(user).to eq(false)
    end

    it "ensure password presence" do
      user = User.new(
        first_name: "junwei",
        last_name: "chan",
        email: "test@gmail.com",
        gender: "Male",
        id_number: "888888888",
        mobile: "88888888"
      ).save
      expect(user).to eq(false)
    end

    it "ensure gender presence" do
      user = User.new(
        first_name: "junwei",
        last_name: "chan",
        email: "test@gmail.com",
        password: "111111",
        id_number: "888888888",
        mobile: "88888888"
      ).save
      expect(user).to eq(false)
    end

    it "ensure id_number presence" do
      user = User.new(
        first_name: "junwei",
        last_name: "chan",
        email: "test@gmail.com",
        password: "111111",
        gender: "Male",
        mobile: "88888888"
      ).save
      expect(user).to eq(false)
    end

    it "ensure mobile presence" do
      user = User.new(
        first_name: "junwei",
        last_name: "chan",
        email: "test@gmail.com",
        password: "111111",
        gender: "Male",
        id_number: "888888888"
      ).save
      expect(user).to eq(false)
    end
  end
  context 'scope tests' do
    let (:params) { {
      first_name: "junwei",
      last_name: "chan",
      password: "111111",
      gender: "Male",
      id_number: "888888888",
      mobile: "88888888"
    } }
    before(:each) do
      User.new(params.merge(email: "test1@gmail.com")).save
      User.new(params.merge(email: "test2@gmail.com")).save
      User.new(params.merge(email: "test3@gmail.com", is_live: "FALSE")).save
      User.new(params.merge(email: "test4@gmail.com", role: "doctor")).save
    end

    it "should return all users" do
      expect(User.all.size).to eq(4)
    end

    it "should return active users" do
      expect(User.where(is_live: "TRUE").size).to eq(3)
    end

    it "should return doctor user" do
      expect(User.where(role: "doctor").size).to eq(1)
    end



  end
end
