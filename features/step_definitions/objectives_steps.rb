Given(/^I have no objectives set$/) do
end

Given(/^I have my objectives set$/) do
  @report = FactoryGirl.create(:filled_in_report)
end

When(/^I create new set of objectives with valid information$/) do
  @page = SitePrism::Pages::NewReport.new
  @page.load

  @page.development_objective_field_1.set 'Objective 1'
  @page.development_objective_field_5.set 'Objective 5'

  @page.save_button.click
end

Then(/^the objectives are saved$/) do
  report = Report.first

  expect(report.development).to match_array(['Objective 1', '', '', '', 'Objective 5', '', '', '', '', ''])
end