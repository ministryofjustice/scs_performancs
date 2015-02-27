Then(/^I should see a dashboard page with my performance reports$/) do
  current_time = Time.now

  Timecop.freeze(current_time) do
    page = UI::Pages::Dashboard.new
    page.displayed?

    expect(page.reports.size).to eql(1)
    expect(page.reports.first.text).to eql(current_time.to_s(:long))
  end
end

And(/^I should see performance reports of my employees$/) do
  page = UI::Pages::Dashboard.new
  page.displayed?

  expect(page.employees_reports.size).to eql(@employees_reports.size)

  names_on_page = page.employees_reports.map(&:text)
  employee_names = @employees_reports.map { |r| r.user.name }

  expect(names_on_page).to eql(employee_names)
end
