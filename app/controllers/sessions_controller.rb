class SessionsController < ApplicationController
  def destroy
    session.delete(:user_id)

    redirect_to new_token_path
  end
end