class TokensController < ApplicationController
  def new
    @token_request_form = TokenRequestForm.new
  end

  def create
    @token_request_form = TokenRequestForm.new(token_params)
    token_sent = @token_request_form.valid? && send_token(@token_request_form.email)

    unless token_sent
      flash[:error] = 'Email address not recognised.'
      render :new
    end
  end

  def show
    token = Token.where(value: params[:id]).first

    session[:user_id] = token.user_id
    redirect_to reports_path
  end

private

  def token_params
    params.require(:token_request_form).permit(:email)
  end

  def send_token(email)
    user = User.where(email: email).first
    if user
      token = user.tokens.create
      TokenMailer.request_email(user, token).deliver_later
      return true
    else
      return false
    end
  end
end
