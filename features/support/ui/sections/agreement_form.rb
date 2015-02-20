module UI
  module Sections
    class AgreementForm < SitePrism::Section
      element :what_field_1, '#agreement_form_what_1'
      element :how_field_1, '#agreement_form_how_1'

      element :what_field_3, '#agreement_form_what_3'
      element :how_field_3, '#agreement_form_how_3'

      element :add_objective, '#add_objective'

      element :save_button, 'input.button'
    end
  end
end
