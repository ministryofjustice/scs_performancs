module World
  module Session
    def login_as(user)
      visit(token_path(user.tokens.create))
    end

    def request_login_token(email)
      @page = UI::Pages::Login.new
      @page.load
      @page.email_field.set email
      @page.request_button.click
    end
  end
end

World(World::Session)
