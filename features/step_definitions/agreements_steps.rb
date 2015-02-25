Given(/^I have no agreements created$/) do
end

When(/^I create new agreement with some objectives$/) do
  @page = UI::Pages::NewAgreement.new
  @page.load

  @page.form.what_field_1.set 'Learn english'
  @page.form.how_field_1.set 'Read children books'

  @page.form.add_objective.click
  @page.form.add_objective.click
  @page.form.what_field_3.set 'Bake pies'

  @page.form.save_button.click
end

Then(/^the agreement is saved$/) do
  agreement = Agreement.first

  expected = [
    { 'type' => '', 'what' => 'Learn english', 'how' => 'Read children books',
      'deliverable' => '', 'measurement' => '' },
    { 'type' => '', 'what' => '', 'how' => '', 'deliverable' => '', 'measurement' => '' },
    { 'type' => '', 'what' => 'Bake pies', 'how' => '', 'deliverable' => '', 'measurement' => '' }
  ] + [{ 'type' => '', 'what' => '', 'how' => '', 'deliverable' => '', 'measurement' => '' }] * 7
  expect(agreement.agreement).to eql(expected)
end

Given(/^I have an existing agreement$/) do
  @agreement = FactoryGirl.create(:filled_in_agreement, user: @user)
end

When(/^I change the objectives on the agreement$/) do
  @page = UI::Pages::EditAgreement.new
  @page.load(id: @agreement.id)

  @page.form.what_field_1.set 'Learn spanish'
  @page.form.how_field_1.set 'Read children books'

  @page.form.add_objective.click
  @page.form.add_objective.click
  @page.form.what_field_3.set 'Bake pies'
  @page.form.how_field_3.set 'Use the oven'

  @page.form.save_button.click
end

Then(/^the changes are saved on the agreement$/) do
  @agreement.reload

  expected = [
    { 'type' => '', 'what' => 'Learn spanish', 'how' => 'Read children books',
      'deliverable' => '', 'measurement' => '' },
    { 'type' => '', 'what' => '', 'how' => '', 'deliverable' => '', 'measurement' => '' },
    { 'type' => '', 'what' => 'Bake pies', 'how' => 'Use the oven',
      'deliverable' => '', 'measurement' => '' }
  ] + [{ 'type' => '', 'what' => '', 'how' => '', 'deliverable' => '', 'measurement' => '' }] * 7

  expect(@agreement.agreement).to eql(expected)

end

Given(/^one of my employees has their agreement set$/) do
  @agreement = FactoryGirl.create(:filled_in_agreement, user: @employee)
end

When(/^I approve that agreement$/) do
  @current_time = Time.now

  @page = UI::Pages::ApproveObjectives.new
  @page.load(id: @agreement.id)

  @page.form.comment.set 'These look good'

  Timecop.freeze(@current_time) do
    @page.form.approve_button.click
  end
end

Then(/^the agreement is approved$/) do
  @agreement.reload
  expect(@agreement.approved_comment).to eql('These look good')
  expect(@agreement.approved_at.to_i).to eql(@current_time.to_i)
end

Then(/^the snapshot of that agreement is stored$/) do
  expect(@agreement.approved_snapshot_agreement).to eql(@agreement.agreement)
end
