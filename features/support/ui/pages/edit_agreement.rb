require_relative '../sections/agreement_form'

module UI
  module Pages
    class EditAgreement < SitePrism::Page
      set_url '/agreements{/id}/edit'

      section :form, UI::Sections::AgreementForm, 'form'
    end
  end
end
