require_relative '../sections/review_form'

module UI
  module Pages
    class EndYearReview < SitePrism::Page
      set_url '/reports{/id}/reviews/end_year/edit'

      section :form, UI::Sections::ReviewForm, 'form'
    end
  end
end
