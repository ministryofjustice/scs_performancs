Given(/^I have not entered personal details$/) do
end

When(/^I enter my personal details$/) do
  page = UI::Pages::EditProfile.new
  page.load
  form = page.form

  form.name_field.set 'Joe Bloggs'
  form.staff_number_field.set '123'
  form.grade_field.set 'Director General A'
  form.current_role_start_date.set '11/2015'

  form.save_button.click
end

Then(/^those personal details are saved$/) do
  @user.reload
  expect(@user.name).to eql('Joe Bloggs')
  expect(@user.staff_number).to eql('123')
  expect(@user.grade).to eql('Director General A')
  expect(@user.current_role_start_date).to eql('11/2015')
end
