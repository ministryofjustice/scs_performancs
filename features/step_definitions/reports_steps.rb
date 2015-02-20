Given(/^There are some users and reports already in the system$/) do
  (1..4).each do |_|
    FactoryGirl.create(:management_report)
  end
end

Given(/^I am an employee$/) do
  @user = FactoryGirl.create(:user)
end

Given(/^I log in/) do
  login_as(@user)
end

Given(/^I am a manager$/) do
  @user = FactoryGirl.create(:user)
  @employee = FactoryGirl.create(:user, manager: @user)
end

And(/^I have employees with reports filled$/) do
  @employees = [
    FactoryGirl.create(:user, manager: @user),
    FactoryGirl.create(:user, manager: @user)
  ]
  @employees_reports = [
    FactoryGirl.create(:filled_in_report, user: @employees[0]),
    FactoryGirl.create(:filled_in_report, user: @employees[1])
  ]
end

Given(/^I have no reports created$/) do
end

Given(/^I have an existing report$/) do
  @report = FactoryGirl.create(:filled_in_report, user: @user)
end

Given(/^one of my employees has their objectives set$/) do
  @employee_report = FactoryGirl.create(:filled_in_report, user: @employee)
end

Given(/^I have some objectives approved$/) do
  @report = FactoryGirl.create(:approved_report, user: @user)
end

Given(/^one of my employees has their objectives approved$/) do
  @employee_report = FactoryGirl.create(:approved_report, user: @employee)
end

Given(/^I have some objectives with mid\-year progress$/) do
  @report = FactoryGirl.create(:report_with_mid_year_review, user: @user)
end

Given(/^one of my employees has their mid\-year review filled$/) do
  @employee_report = FactoryGirl.create(:report_with_mid_year_review, user: @employee)
end

Given(/^I have some objectives and mid\-year review approved$/) do
  @report = FactoryGirl.create(:report_with_mid_year_approved, user: @user)
end

Given(/^one of my employees has their mid\-year review approved$/) do
  @employee_report = FactoryGirl.create(:report_with_mid_year_approved, user: @employee)
end

Given(/^I have some objectives, mid\-year review and end\-year review in progress$/) do
  @report = FactoryGirl.create(:report_with_end_year_review, user: @user)
end

Given(/^one of my employees has their end\-year review filled$/) do
  @employee_report = FactoryGirl.create(:report_with_end_year_review, user: @employee)
end

When(/^I create new report with some objectives$/) do
  @page = UI::Pages::NewReport.new
  @page.load

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

  @page.form.add_objective.click
  @page.form.add_objective.click
  @page.form.smart_objective_what_field_3.set 'Bake pies'
  @page.form.smart_objective_how_field_3.set 'Use the oven'

  @page.form.development_objective_field_1.set 'Changed Objective 1'

  @page.form.add_development.click
  @page.form.development_objective_field_2.set 'New Objective'

  @page.form.add_development.click
  @page.form.add_development.click
  @page.form.add_development.click
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

When(/^I enter my (mid|end)\-year progress against my objectives$/) do |phase|
  page_class = "UI::Pages::#{phase.camelize}YearReview".constantize
  @page = page_class.new
  @page.load(id: @report.id)

  @page.form.smart_objective_what_field_1.set 'Almost achieved'
  @page.form.smart_objective_how_field_1.set 'Attended 3 times'

  @page.form.development_objective_field_1.set 'Did PRINCE2 course'

  @page.form.comment.set 'This year has been great so far'

  @page.form.save_button.click
end

When(/^I try to enter my employee's (mid|end)-year review$/) do |phase|
  page_class = "UI::Pages::#{phase.camelize}YearReview".constantize
  @page = page_class.new
  @page.load(id: @employee_report.id)
end

Then(/^my (mid|end)\-year progress should be saved$/) do |phase|
  @report.reload

  expected_smart_review = [
    { 'what' => 'Almost achieved', 'how' => 'Attended 3 times' }
  ] + [{ 'what' => '', 'how' => '' }] * 9
  expected_development_review = ['Did PRINCE2 course'] + ([''] * 9)
  expected_comment = 'This year has been great so far'

  expect(@report.send("#{phase}_year_review_smart")).to eql(expected_smart_review)
  expect(@report.send("#{phase}_year_review_development")).to eql(expected_development_review)
  expect(@report.send("#{phase}_year_review_comment")).to eql(expected_comment)
end

When(/^I change my (mid|end)\-year progress against my objectives$/) do |phase|
  page_class = "UI::Pages::#{phase.camelize}YearReview".constantize
  @page = page_class.new
  @page.load(id: @report.id)

  @page.form.smart_objective_what_field_1.set 'Changed'
  @page.form.smart_objective_how_field_1.set 'Attended 3 times'

  @page.form.development_objective_field_1.set 'Did PRINCE2 course'
  @page.form.development_objective_field_2.set 'Still do not know how to use a printer'

  @page.form.comment.set 'Actually, it has not been so good'

  @page.form.save_button.click
end

Then(/^the changes are saved on my (mid|end)\-year progress$/) do |phase|
  @report.reload

  expected_smart_review = [
    { 'what' => 'Changed', 'how' => 'Attended 3 times' }
  ] + [{ 'what' => '', 'how' => '' }] * 9
  expected_development_review = [
    'Did PRINCE2 course', 'Still do not know how to use a printer'
  ] + ([''] * 8)
  expected_comment = 'Actually, it has not been so good'

  expect(@report.send("#{phase}_year_review_smart")).to eql(expected_smart_review)
  expect(@report.send("#{phase}_year_review_development")).to eql(expected_development_review)
  expect(@report.send("#{phase}_year_review_comment")).to eql(expected_comment)
end

When(/^I approve those objectives$/) do
  @current_time = Time.now

  @page = UI::Pages::ApproveObjectives.new
  @page.load(id: @employee_report.id)

  @page.form.comment.set 'These look good'

  Timecop.freeze(@current_time) do
    @page.form.approve_button.click
  end
end

When(/^I try to approve my objectives$/) do
  @page = UI::Pages::ApproveObjectives.new
  @page.load(id: @report.id)
end

Then(/^The objectives are approved$/) do
  @employee_report.reload

  expect(@employee_report.approved_comment).to eql('These look good')
  expect(@employee_report.approved_at.to_i).to eql(@current_time.to_i)
end

Then(/^The snapshot of those objectives is stored$/) do
  expect(@employee_report.approved_snapshot_development).to eql(@employee_report.development)
  expect(@employee_report.approved_snapshot_smart).to eql(@employee_report.smart)
end

When(/^I approve this (mid|end)\-year review$/) do |phase|
  @current_time = Time.now
  @phase = "#{phase}_year"

  page_class = "UI::Pages::Approve#{phase.camelize}YearReview".constantize
  @page = page_class.new
  @page.load(id: @employee_report.id)

  @page.form.comment.set 'You should speed up'

  Timecop.freeze(@current_time) do
    @page.form.approve_button.click
  end
end

When(/^I try to approve my (mid|end)-year review$/) do |phase|
  page_class = "UI::Pages::Approve#{phase.camelize}YearReview".constantize
  @page = page_class.new
  @page.load(id: @report.id)
end

Then(/^The review is approved$/) do
  @employee_report.reload

  expect(@employee_report.send("#{@phase}_approved_comment")).to eql('You should speed up')
  expect(@employee_report.send("#{@phase}_approved_at").to_i).to eql(@current_time.to_i)
end

And(/^The snapshot of the objectives is stored$/) do
  development_snapshot = @employee_report.send("#{@phase}_approved_snapshot_development")
  smart_snapshot = @employee_report.send("#{@phase}_approved_snapshot_smart")

  expect(development_snapshot).to eql(@employee_report.development)
  expect(smart_snapshot).to eql(@employee_report.smart)
end

When(/^I request access using my e\-mail$/) do
  page = UI::Pages::Login.new
  page.load

  page.email_field.set @user.email
  page.request_button.click
end

When(/^I click on the link in the e\-mail$/) do
  open_email(@user.email)

  # host = Rails.configuration.action_mailer[:default_url_options][:host]
  link = current_email.body.match(%r{^https?://.*$})[0]
  visit(link)
end

Then(/^I should see a dashboard page with my performance reports$/) do
  page = UI::Pages::Dashboard.new
  page.displayed?

  expect(page.reports.size).to eql(1)
  expect(page.reports.first.text).to eql(@report.id.to_s)
end

And(/^I should see performance reports of my employees$/) do
  page = UI::Pages::Dashboard.new
  page.displayed?

  expect(page.employees_reports.size).to eql(@employees_reports.size)

  ids_on_page = page.employees_reports.map(&:text)
  ids_in_db = @employees_reports.map { |r| r.id.to_s }

  expect(ids_on_page).to eql(ids_in_db)
end

When(/^I try to change my employee's objectives$/) do
  @page = UI::Pages::EditReport.new
  @page.load(id: @employees_reports.first.id)
end

Then(/^I get an access error$/) do
  expect(@page.status_code).to be 403
end
