class FacilitiesController < ApplicationController
  def new
    @facility = Facility.new
  end

  def create
    # # Hack for MVP, Should be replaced with form validation
    # User.transaction do
    #   @user = User.new(user_params)
    #
    #   if @user.save!
    #     @volunteer = Volunteer.new(volunteer_params.merge(available: true, user: @user))
    #     if @volunteer.save!
    #       sign_in @user
    #       flash.now[:notice] = "Welcome to Corona Safe"
    #       redirect_to root_path
    #     else
    #       flash.now[:notice] = "The details you provided are incorrect, Please try again"
    #       redirect_back(fallback_location: root_path)
    #     end
    #   else
    #     flash.now[:notice] = "The details you provided are incorrect, Please try again"
    #     redirect_back(fallback_location: root_path)
    #   end
    # end
  end

  private

  def user_params
    params.require(:volunteer).permit(:email, :password, :password_confirmation, :mobile_number, :age, :gender, :district_id)
  end

  def volunteer_params
    params.require(:volunteer).permit(:role_id, :skill_id)
  end
end
