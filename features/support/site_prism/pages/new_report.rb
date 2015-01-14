module SitePrism
  module Pages
    class NewReport < SitePrism::Page
      set_url '/reports/new'

      element :development_objective_field_1, 'form #report_form_development_1'
      element :development_objective_field_5, 'form #report_form_development_5'
      element :save_button, 'form input.button'
    end
  end
end