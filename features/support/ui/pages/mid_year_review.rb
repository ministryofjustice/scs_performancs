require_relative '../sections/review_form'

module UI
  module Pages
    class MidYearReview < SitePrism::Page
      set_url '/reports{/id}/reviews/mid_year/edit'

      section :form, UI::Sections::ReviewForm, 'form'
    end
  end
end
