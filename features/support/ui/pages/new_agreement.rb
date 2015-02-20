require_relative '../sections/agreement_form'

module UI
  module Pages
    class NewAgreement < SitePrism::Page
      set_url '/agreements/new'

      section :form, UI::Sections::AgreementForm, 'form'
    end
  end
end
