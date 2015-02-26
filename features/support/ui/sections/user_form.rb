module UI
  module Sections
    class UserForm < SitePrism::Section
      element :name_field, '#user_name'
      element :staff_number_field, '#user_staff_number'
      element :grade_field, '#user_grade'
      element :organisation_field, '#user_organisation'

      element :save_button, 'input.button'
    end
  end
end
