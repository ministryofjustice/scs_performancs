Then(/^I see approval date on the employee reports dashboard$/) do
  approval_date = @report.approved_at

  check_employee_approval_status approval_date, 'awaiting submission', ''
end

Then(/^I see mid-year approval date on the employee reports dashboard$/) do
  approval_date = @report.approved_at
  mid_year_date = @report.mid_year_approved_at

  check_employee_approval_status approval_date, mid_year_date, 'awaiting submission'
end

Then(/^I see end-year approval date on the employee reports dashboard$/) do
  approval_date = @report.approved_at
  mid_year_date = @report.mid_year_approved_at
  end_year_date = @report.end_year_approved_at

  check_employee_approval_status approval_date, mid_year_date, end_year_date
end
