Given(/^I have no reports created$/) do
end

Given(/^I have an existing report$/) do
  @report = FactoryGirl.create(:filled_in_report)
end

When(/^I create new report with some objectives$/) do
  @page = UI::Pages::NewReport.new
  @page.load

  @page.development_objective_field_1.set 'Objective 1'
  @page.development_objective_field_5.set 'Objective 5'

  @page.save_button.click
end

Then(/^the report are saved$/) do
  report = Report.first

  expect(report.development).to match_array(['Objective 1', '', '', '', 'Objective 5', '', '', '', '', ''])
end

When(/^I change some objectives on the report$/) do
end

Then(/^the changes are saved on the report$/) do
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