require_relative '../sections/report_form'

module UI
  module Pages
    class EditReport < SitePrism::Page
      set_url '/reports{/id}/edit'

      section :form, UI::Sections::ReportForm, 'form'
    end
  end
end
