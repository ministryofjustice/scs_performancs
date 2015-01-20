require_relative '../sections/report_form'

module UI
  module Pages
    class MidYearReview < SitePrism::Page
      set_url '/reports{/id}/reviews/mid_year/edit'

      section :form, UI::Sections::ReportForm, 'form'
    end
  end
end
