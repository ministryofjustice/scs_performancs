module UI
  module Sections
    class UserForm < SitePrism::Section
      element :name_field, '#user_name'
      element :staff_number_field, '#user_staff_number'
      element :grade_field, '#user_grade'
      element :current_role_start_date, '#user_current_role_start_date'

      element :save_button, 'input.button'
    end
  end
end
