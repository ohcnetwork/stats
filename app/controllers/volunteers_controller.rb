class VolunteersController < ApplicationController
  def signup
  end

  def create
    # Hack for MVP, Should be replaced with form validation

    User.transaction do
      details = params['volunteer']
      district = District.find(details[:district_id])
      role = Role.find(details[:role_id])
      skill = Skill.find(details[:skill_id])
      user = User.new(email: details['email'], password: details['password'], district: district, age: details['age'], mobile_number: details['mobile_number'], gender: details['gender'])
      if user.save
        sign_in user
        Volunteer.create!(user: user, skill: skill, role: role, available: true)
        flash[:success] = "Welcome to Corona Safe"
        redirect_to root_path
      else
        flash[:error] = "The details you provided are incorrect, Please try again"
        redirect_back(fallback_location: root_path)
      end
    end
  end
end
