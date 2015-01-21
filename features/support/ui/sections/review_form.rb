module UI
  module Sections
    class ReviewForm < SitePrism::Section
      element :smart_objective_what_field_1, '#review_form_smart_what_1'
      element :smart_objective_what_field_3, '#review_form_smart_what_3'
      element :smart_objective_how_field_1, '#review_form_smart_how_1'
      element :smart_objective_how_field_3, '#review_form_smart_how_3'

      element :development_objective_field_1, '#review_form_development_1'
      element :development_objective_field_2, '#review_form_development_2'
      element :development_objective_field_5, '#review_form_development_5'

      element :comment, '#review_form_comment'

      element :save_button, 'input.button'
    end
  end
end
