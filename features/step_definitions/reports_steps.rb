Given(/^I have no reports created$/) do
end

Given(/^I have an existing report$/) do
  @report = FactoryGirl.create(:filled_in_report)
end

When(/^I create new report with some objectives$/) do
  @page = UI::Pages::NewReport.new
  @page.load

  @page.form.smart_objective_what_field_1.set 'Learn english'
  @page.form.smart_objective_how_field_1.set 'Read children books'
  @page.form.smart_objective_what_field_3.set 'Bake pies'

  @page.form.development_objective_field_1.set 'Objective 1'
  @page.form.development_objective_field_5.set 'Objective 5'

  @page.form.save_button.click
end

Then(/^the report are saved$/) do
  report = Report.first

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

When(/^I change the objectives on the report$/) do
  @page = UI::Pages::EditReport.new
  @page.load(id: @report.id)

  @page.form.smart_objective_what_field_1.set 'Learn spanish'
  @page.form.smart_objective_how_field_1.set 'Read children books'
  @page.form.smart_objective_what_field_3.set 'Bake pies'
  @page.form.smart_objective_how_field_3.set 'Use the oven'

  @page.form.development_objective_field_1.set 'Changed Objective 1'
  @page.form.development_objective_field_2.set 'New Objective'
  @page.form.development_objective_field_5.set 'Changed Objective 5'

  @page.form.save_button.click
end

Then(/^the changes are saved on the report$/) do
  @report.reload

  expected = ['Changed Objective 1', 'New Objective', '', '',
              'Changed Objective 5', '', '', '', '', '']
  expect(@report.development).to match_array(expected)

  expected_smart = [
    { 'what' => 'Learn spanish', 'how' => 'Read children books' },
    { 'what' => '', 'how' => '' },
    { 'what' => 'Bake pies', 'how' => 'Use the oven' },
    { 'what' => '', 'how' => '' },
    { 'what' => '', 'how' => '' },
    { 'what' => '', 'how' => '' },
    { 'what' => '', 'how' => '' },
    { 'what' => '', 'how' => '' },
    { 'what' => '', 'how' => '' },
    { 'what' => '', 'how' => '' }
  ]
  expect(@report.smart).to match_array(expected_smart)
end

When(/^I display the reports page$/) do
  @page = UI::Pages::ReportsList.new
  @page.load
end

Then(/^I can see the existing report on the page$/) do
  report_ids = @page.report_ids.map { |element| element.text.to_i }

  expect(report_ids.size).to be(1)
  expect(report_ids.first).to eql(@report.id)
end
