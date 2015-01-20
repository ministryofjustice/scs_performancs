require_relative '../sections/objectives_form'

module UI
  module Pages
    class NewReport < SitePrism::Page
      set_url '/reports/new'

      section :form, UI::Sections::ReportForm, 'form'
    end
  end
end
