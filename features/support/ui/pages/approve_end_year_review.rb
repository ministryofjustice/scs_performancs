require_relative '../sections/approval_form'

module UI
  module Pages
    class ApproveEndYearReview < SitePrism::Page
      set_url '/reports{/id}/approvals/end_year/edit'

      section :form, UI::Sections::ApprovalForm, 'form'
    end
  end
end
