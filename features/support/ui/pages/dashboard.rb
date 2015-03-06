module UI
  module Pages
    class Dashboard < SitePrism::Page
      set_url '/reports'
      set_url_matcher(/\/reports$/)

      elements :reports,          'table.reports tbody tr td:first'
      element :initial_approval,  'table.reports tbody tr:first td:nth-child(2)'
      element :mid_year_approval, 'table.reports tbody tr:first td:nth-child(3)'
      element :end_year_approval, 'table.reports tbody tr:first td:nth-child(4)'

      elements :employees_reports,         'table.employees-reports tbody tr td:first'
      element :employee_initial_approval,  'table.employees-reports tbody tr:first td:nth-child(2)'
      element :employee_mid_year_approval, 'table.employees-reports tbody tr:first td:nth-child(3)'
      element :employee_end_year_approval, 'table.employees-reports tbody tr:first td:nth-child(4)'

      element :create_new_report, 'a[href="/reports/new"]'
    end
  end
end
