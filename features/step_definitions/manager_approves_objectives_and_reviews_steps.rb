Then(/^I see approval date on the employee reports dashboard$/) do
  page = UI::Pages::Dashboard.new
  page.displayed?

  approval_date = @report.approved_at.to_date.to_s(:short).strip

  expect(page.employees_initial_approval.first.text).to eql(approval_date)
  expect(page.employees_mid_year_approval.first.text).to eql('awaiting submission')
  expect(page.employees_end_year_approval.first.text).to eql('')
end

Then(/^I see mid-year approval date on the employee reports dashboard$/) do
  page = UI::Pages::Dashboard.new
  page.displayed?

  approval_date = @report.approved_at.to_date.to_s(:short).strip
  mid_year_date = @report.mid_year_approved_at.to_date.to_s(:short).strip

  expect(page.employees_initial_approval.first.text).to eql(approval_date)
  expect(page.employees_mid_year_approval.first.text).to eql(mid_year_date)
  expect(page.employees_end_year_approval.first.text).to eql('awaiting submission')
end

Then(/^I see end-year approval date on the employee reports dashboard$/) do
  page = UI::Pages::Dashboard.new
  page.displayed?

  approval_date = @report.approved_at.to_date.to_s(:short).strip
  mid_year_date = @report.mid_year_approved_at.to_date.to_s(:short).strip
  end_year_date = @report.end_year_approved_at.to_date.to_s(:short).strip

  expect(page.employees_initial_approval.first.text).to eql(approval_date)
  expect(page.employees_mid_year_approval.first.text).to eql(mid_year_date)
  expect(page.employees_end_year_approval.first.text).to eql(end_year_date)
end
