require_relative '../sections/report_form'

module UI
  module Pages
    class NewReport < SitePrism::Page
      set_url '/reports/new'

      section :form, UI::Sections::ReportForm, 'form'
    end
  end
end
