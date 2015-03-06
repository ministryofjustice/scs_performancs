module UI
  module Pages
    class Login < SitePrism::Page
      set_url '/tokens/new'

      element :error, '.error'

      element :email_field, '#token_request_form_email'

      element :request_button, 'input.button'
    end
  end
end
