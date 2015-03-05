Then(/^I see a dashboard page with my performance reports$/) do
  current_time = Time.now

  Timecop.freeze(current_time) do
    dashboard.displayed?

    expect(dashboard.reports.size).to eql(1)
    expect(dashboard.reports.first.text).to eql(current_time.to_s(:long))
  end
end

Then(/^I see performance report approval dates$/) do
  initial_date = date_format 5.days.ago
  mid_year_date = date_format 3.days.ago

  check_my_approval_status initial_date, mid_year_date, 'awaiting approval'
end

And(/^I see performance reports of my employees$/) do
  expect(dashboard.employees_reports.size).to eql(@employees_reports.size)

  names_on_page = dashboard.employees_reports.map(&:text)
  employee_names = @employees_reports.map { |r| r.user.name }

  expect(names_on_page).to eql(employee_names)
end

And(/^I see employee reports approval status$/) do
  submitted_date = date_format @employees_reports.first.updated_at

  check_employee_approval_status "submitted on: #{submitted_date}", '', ''
end
