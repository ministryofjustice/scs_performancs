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
  @report = FactoryGirl.create(:filled_in_report, user: @employee)
end

Given(/^I have some objectives approved$/) do
  @report = FactoryGirl.create(:approved_report, user: @user)
end

Given(/^one of my employees has their objectives approved$/) do
  @report = FactoryGirl.create(:approved_report, user: @employee)
end

Given(/^I have some objectives with mid\-year progress$/) do
  @report = FactoryGirl.create(:report_with_mid_year_review, user: @user)
end

Given(/^one of my employees has their mid\-year review filled$/) do
  @report = FactoryGirl.create(:report_with_mid_year_review, user: @employee)
end

Given(/^I have some objectives and mid\-year review approved$/) do
  @report = FactoryGirl.create(:report_with_mid_year_approved, user: @user)
end

Given(/^one of my employees has their mid\-year review approved$/) do
  @report = FactoryGirl.create(:report_with_mid_year_approved, user: @employee)
end

Given(/^I have some objectives, mid\-year review and end\-year review in progress$/) do
  @report = FactoryGirl.create(:report_with_end_year_review, user: @user)
end

Given(/^one of my employees has their end\-year review filled$/) do
  @report = FactoryGirl.create(:report_with_end_year_review, user: @employee)
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

  if @report.is_a?(ManagementReport)
    @page.form.smart_objective_what_field_1.set 'Almost achieved'
    @page.form.smart_objective_how_field_1.set 'Attended 3 times'

    @page.form.development_objective_field_1.set 'Did PRINCE2 course'
  end

  @page.form.comment.set 'This year has been great so far'

  @page.form.save_button.click
end

When(/^I try to enter my employee's (mid|end)-year review$/) do |phase|
  page_class = "UI::Pages::#{phase.camelize}YearReview".constantize
  @page = page_class.new
  @page.load(id: @report.id)
end

Then(/^my (mid|end)\-year progress should be saved$/) do |phase|
  @report.reload

  if @report.is_a?(ManagementReport)
    expected_smart_review = [
      { 'what' => 'Almost achieved', 'how' => 'Attended 3 times' }
    ] + [{ 'what' => '', 'how' => '' }] * 9
    expected_development_review = ['Did PRINCE2 course'] + ([''] * 9)

    expect(@report.send("#{phase}_year_review_smart")).to eql(expected_smart_review)
    expect(@report.send("#{phase}_year_review_development")).to eql(expected_development_review)
  end

  expected_comment = 'This year has been great so far'
  expect(@report.send("#{phase}_year_review_comment")).to eql(expected_comment)
end

When(/^I change my (mid|end)\-year progress against my objectives$/) do |phase|
  page_class = "UI::Pages::#{phase.camelize}YearReview".constantize
  @page = page_class.new
  @page.load(id: @report.id)

  if @report.is_a?(ManagementReport)
    @page.form.smart_objective_what_field_1.set 'Changed'
    @page.form.smart_objective_how_field_1.set 'Attended 3 times'

    @page.form.development_objective_field_1.set 'Did PRINCE2 course part 1'
  end

  @page.form.comment.set 'Actually, it has not been so good'

  @page.form.save_button.click
end

Then(/^the changes are saved on my (mid|end)\-year progress$/) do |phase|
  @report.reload

  if @report.is_a?(ManagementReport)
    expected_smart_review = [
      { 'what' => 'Changed', 'how' => 'Attended 3 times' }
    ] + [{ 'what' => '', 'how' => '' }] * 9
    expected_development_review = [
      'Did PRINCE2 course part 1'
    ] + ([''] * 9)

    expect(@report.send("#{phase}_year_review_smart")).to eql(expected_smart_review)
    expect(@report.send("#{phase}_year_review_development")).to eql(expected_development_review)
  end

  expected_comment = 'Actually, it has not been so good'
  expect(@report.send("#{phase}_year_review_comment")).to eql(expected_comment)
end

When(/^I approve those objectives$/) do
  @current_time = Time.now

  @page = UI::Pages::ApproveObjectives.new
  @page.load(id: @report.id)

  @page.form.comment.set 'These look good'

  Timecop.freeze(@current_time) do
    @page.form.approve_button.click
  end
end

When(/^I try to approve my objectives$/) do
  @page = UI::Pages::ApproveObjectives.new
  @page.load(id: @report.id)
end

Then(/^the objectives are approved$/) do
  @report.reload

  expect(@report.approved_comment).to eql('These look good')
  expect(@report.approved_at.to_i).to eql(@current_time.to_i)
end

Then(/^the snapshot of those objectives is stored$/) do
  if @report.is_a?(Agreement)
    expect(@report.approved_snapshot_agreement).to eql(@report.agreement)
  else
    expect(@report.approved_snapshot_development).to eql(@report.development)
    expect(@report.approved_snapshot_smart).to eql(@report.smart)
  end
end

When(/^I approve this (mid|end)\-year review$/) do |phase|
  @current_time = Time.now
  @phase = "#{phase}_year"

  page_class = "UI::Pages::Approve#{phase.camelize}YearReview".constantize
  @page = page_class.new
  @page.load(id: @report.id)

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
  @report.reload

  expect(@report.send("#{@phase}_approved_comment")).to eql('You should speed up')
  expect(@report.send("#{@phase}_approved_at").to_i).to eql(@current_time.to_i)
end

And(/^The snapshot of the objectives is stored$/) do
  development_snapshot = @report.send("#{@phase}_approved_snapshot_development")
  smart_snapshot = @report.send("#{@phase}_approved_snapshot_smart")

  expect(development_snapshot).to eql(@report.development)
  expect(smart_snapshot).to eql(@report.smart)
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

When(/^I try to change my employee's objectives$/) do
  @page = UI::Pages::EditReport.new
  @page.load(id: @employees_reports.first.id)
end

Then(/^I get an access error$/) do
  expect(@page.status_code).to be 403
end
