module UI
  module Sections
    class ObjectivesForm < SitePrism::Section
      element :review_period, '#objectives_form_review_period'

      element :smart_objective_what_field_1, '#objectives_form_smart_what_1'
      element :smart_objective_what_field_3, '#objectives_form_smart_what_3'
      element :smart_objective_how_field_1, '#objectives_form_smart_how_1'
      element :smart_objective_how_field_3, '#objectives_form_smart_how_3'

      element :add_objective, '#add_objective'
      element :add_development, '#add_development'

      element :development_objective_field_1, '#objectives_form_development_1'
      element :development_objective_field_2, '#objectives_form_development_2'
      element :development_objective_field_5, '#objectives_form_development_5'

      element :save_button, 'input.button'
    end
  end
end
