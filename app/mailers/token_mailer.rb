class TokenMailer < ActionMailer::Base
  default from: 'no-reply@digital.justice.gov.uk'

  def request_email(user, token)
    @token = token

    mail to: user.email, subject: 'SCS Performance Management Reports Access'
  end
end
