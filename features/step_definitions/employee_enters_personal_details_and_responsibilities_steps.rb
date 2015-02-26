Given(/^I have not entered personal details$/) do
end

When(/^I enter my personal details$/) do
  page = UI::Pages::EditProfile.new
  page.load
  form = page.form

  form.name_field.set 'Joe Bloggs'
  form.staff_number_field.set '123'
  form.grade_field.set 'A'
  form.organisation_field.set 'NOMS'

  form.save_button.click
end

Then(/^those personal details are saved$/) do
  @user.reload
  expect(@user.name).to eql('Joe Bloggs')
  expect(@user.staff_number).to eql('123')
  expect(@user.grade).to eql('A')
  expect(@user.organisation).to eql('NOMS')
end
