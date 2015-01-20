require_relative '../sections/objectives_form'

module UI
  module Pages
    class EditReport < SitePrism::Page
      set_url '/reports{/id}/edit'

      section :form, UI::Sections::ObjectivesForm, 'form'
    end
  end
end
