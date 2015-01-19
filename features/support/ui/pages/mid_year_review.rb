require_relative '../sections/report_form'

module UI
  module Pages
    class MidYearReview < SitePrism::Page
      set_url '/reports{/id}/mid_year_review'

      section :form, UI::Sections::ReportForm, 'form'
    end
  end
end
