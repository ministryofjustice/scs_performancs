module UI
  module Pages
    class Dashboard < SitePrism::Page
      set_url '/reports'
      set_url_matcher(/\/reports$/)

      elements :reports,           'table.reports tbody tr td:first'
      elements :initial_approval,  'table.reports tbody tr td:nth-child(2)'
      elements :mid_year_approval, 'table.reports tbody tr td:nth-child(3)'
      elements :end_year_approval, 'table.reports tbody tr td:nth-child(4)'

      elements :employees_reports, 'table.employees-reports tbody tr td:first'
    end
  end
end
