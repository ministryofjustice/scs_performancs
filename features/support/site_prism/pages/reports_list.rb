module SitePrism
  module Pages
    class ReportsList < SitePrism::Page
      set_url '/reports'

      elements :report_ids, 'table tr td:first'
    end
  end
end