class SessionsController < ApplicationController
  before_action :ensure_user

  def destroy
    session.delete(:user_id)

    redirect_to new_token_path
  end
end
