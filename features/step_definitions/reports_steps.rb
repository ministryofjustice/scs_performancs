Given(/^I am a manager$/) do
  # This will change when user roles are introduced
end

Given(/^I have no reports created$/) do
end

Given(/^I have an existing report$/) do
  @report = FactoryGirl.create(:filled_in_report)
end

Given(/^I one of my employees has their objectives set$/) do
  @report = FactoryGirl.create(:filled_in_report)
end

Given(/^I have some objectives approved$/) do
  @report = FactoryGirl.create(:approved_report)
end

Given(/^I have some objectives with mid\-year progress$/) do
  @report = FactoryGirl.create(:report_with_mid_year_review)
end

Given(/^I one of my employees has their mid\-year review filled$/) do
  @report = FactoryGirl.create(:report_with_mid_year_review)
end

Given(/^I have some objectives and mid\-year review approved$/) do
  @report = FactoryGirl.create(:report_with_mid_year_approved)
end

Given(/^I have some objectives, mid\-year review and end\-year review in progress$/) do
  @report = FactoryGirl.create(:report_with_end_year_review)
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
  @page.load(id: @report.id)

  @page.form.comment.set 'These look good'

  Timecop.freeze(@current_time) do
    @page.form.approve_button.click
  end
end

Then(/^The objectives are approved$/) do
  @report.reload

  expect(@report.approved_comment).to eql('These look good')
  expect(@report.approved_at.to_i).to eql(@current_time.to_i)
end

Then(/^The snapshot of those objectives is stored$/) do
  expect(@report.approved_snapshot_development).to eql(@report.development)
  expect(@report.approved_snapshot_smart).to eql(@report.smart)
end

When(/^I approve this mid\-year review$/) do
  @current_time = Time.now

  @page = UI::Pages::ApproveMidYearReview.new
  @page.load(id: @report.id)

  @page.form.comment.set 'You should speed up'

  Timecop.freeze(@current_time) do
    @page.form.approve_button.click
  end
end

Then(/^The review is approved$/) do
  @report.reload

  expect(@report.mid_year_review_approved_comment).to eql('You should speed up')
  expect(@report.mid_year_review_approved_at.to_i).to eql(@current_time.to_i)
end

And(/^The snapshot the objectives is stored$/) do
  expect(@report.mid_year_review_snapshot_development).to eql(@report.development)
  expect(@report.mid_year_review_snapshot_smart).to eql(@report.smart)
end
