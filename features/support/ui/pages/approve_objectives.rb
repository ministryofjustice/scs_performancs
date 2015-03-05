require_relative '../sections/approval_form'

module UI
  module Pages
    class ApproveObjectives < SitePrism::Page
      set_url '/reports{/id}/approvals/initial/edit'

      element :review_period, '#review_period'
      section :form, UI::Sections::ApprovalForm, 'form'
    end
  end
end
