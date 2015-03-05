require_relative '../sections/approval_form'

module UI
  module Pages
    class ApproveMidYearReview < SitePrism::Page
      set_url '/reports{/id}/approvals/mid_year/edit'

      element :review_period, '#review_period'
      section :form, UI::Sections::ApprovalForm, 'form'
    end
  end
end
