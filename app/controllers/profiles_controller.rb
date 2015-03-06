class ProfilesController < ApplicationController
  before_action :ensure_user

  def edit
    @user = current_user
  end

  def update
    current_user.update! profile_params
    redirect_to controller: :reports, action: :index
  end

private

  def profile_params
    allowed = %w[name staff_number grade current_role_start_date]
    params.require(:user).permit(allowed)
  end

end
