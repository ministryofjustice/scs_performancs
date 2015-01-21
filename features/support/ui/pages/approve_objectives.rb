require_relative '../sections/approval_form'

module UI
  module Pages
    class ApproveObjectives < SitePrism::Page
      set_url '/reports{/id}/approve/initial/edit'

      section :form, UI::Sections::ApprovalForm, 'form'
    end
  end
end
