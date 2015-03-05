When(/^I create new report with some objectives$/) do
  @page = UI::Pages::NewReport.new
  @page.load

  @page.form.review_period.set '2015/16'

  @page.form.smart_objective_what_field_1.set 'Learn english'
  @page.form.smart_objective_how_field_1.set 'Read children books'

  @page.form.add_objective.click
  @page.form.add_objective.click

  @page.form.smart_objective_what_field_3.set 'Bake pies'

  @page.form.development_objective_field_1.set 'Objective 1'

  @page.form.add_development.click
  @page.form.add_development.click
  @page.form.add_development.click
  @page.form.add_development.click
  @page.form.development_objective_field_5.set 'Objective 5'

  @page.form.save_button.click
end

Then(/^the report is saved$/) do
  report = Report.first

  expect(report.review_period).to eql('2015/16')

  expected_development = [
    'Objective 1', '', '', '', 'Objective 5', '', '', '', '', ''
  ]
  expect(report.development).to match_array(expected_development)

  expected_smart = [
    { 'what' => 'Learn english', 'how' => 'Read children books' },
    { 'what' => '', 'how' => '' },
    { 'what' => 'Bake pies', 'how' => '' },
    { 'what' => '', 'how' => '' },
    { 'what' => '', 'how' => '' },
    { 'what' => '', 'how' => '' },
    { 'what' => '', 'how' => '' },
    { 'what' => '', 'how' => '' },
    { 'what' => '', 'how' => '' },
    { 'what' => '', 'how' => '' }
  ]
  expect(report.smart).to eql(expected_smart)
end
