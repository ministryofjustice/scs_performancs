class ProfilesController < ApplicationController
  before_action :ensure_user

  def edit
    @user = current_user
  end

  def update
    current_user.update! profile_params
    redirect_to controller: :agreements, action: :index
  end

private

  def profile_params
    params.require(:user).permit(%w[name staff_number grade organisation])
  end

end
