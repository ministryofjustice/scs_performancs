module World
  module Session
    def login_as(user)
      visit(token_path(user.tokens.create))
    end
  end
end

World(World::Session)
