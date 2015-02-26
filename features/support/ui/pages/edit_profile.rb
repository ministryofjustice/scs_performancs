require_relative '../sections/user_form'

module UI
  module Pages
    class EditProfile < SitePrism::Page
      set_url '/profile/edit'
      set_url_matcher(%r{\/profle\/edit$})

      section :form, UI::Sections::UserForm, 'form'
    end
  end
end
