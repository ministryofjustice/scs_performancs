module World
  module Pages
    def dashboard
      @dashboard ||= UI::Pages::Dashboard.new
    end
  end
end

World(World::Pages)
