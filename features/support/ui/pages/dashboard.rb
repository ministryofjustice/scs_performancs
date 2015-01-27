module UI
  module Pages
    class Dashboard < SitePrism::Page
      set_url '/reports'
      set_url_matcher(/\/reports$/)

      elements :reports, 'table.reports tbody tr td:first'

      elements :employees_reports, 'table.employees-reports tbody tr td:first'
    end
  end
end
