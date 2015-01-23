module UI
  module Pages
    class Login < SitePrism::Page
      set_url '/tokens/new'

      element :email_field, '#token_email'

      element :request_button, 'input.button'
    end
  end
end
