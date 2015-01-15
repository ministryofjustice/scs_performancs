module UI
  module Sections
    class ReportForm < SitePrism::Section
      element :smart_objective_what_field_1, '#report_form_smart_what_1'
      element :smart_objective_what_field_3, '#report_form_smart_what_3'
      element :smart_objective_how_field_1, '#report_form_smart_how_1'
      element :smart_objective_how_field_3, '#report_form_smart_how_3'

      element :development_objective_field_1, '#report_form_development_1'
      element :development_objective_field_2, '#report_form_development_2'
      element :development_objective_field_5, '#report_form_development_5'

      element :save_button, 'input.button'
    end
  end
end
