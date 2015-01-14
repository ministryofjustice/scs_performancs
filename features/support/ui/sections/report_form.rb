module UI
  module Sections
    class ReportForm < SitePrism::Section
      element :development_objective_field_1, '#report_form_development_1'
      element :development_objective_field_2, '#report_form_development_2'
      element :development_objective_field_5, '#report_form_development_5'
      element :save_button, 'input.button'
    end
  end
end