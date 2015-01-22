module UI
  module Sections
    class ApprovalForm < SitePrism::Section
      element :comment, '#approval_form_comment'

      element :approve_button, 'input.button'
    end
  end
end
