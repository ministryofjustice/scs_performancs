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

Given(/^one of my employees has their objectives agreement set$/) do
  @report = FactoryGirl.create(:filled_in_agreement, user: @employee)
end

Given(/^I have an agreement approved$/) do
  @report = FactoryGirl.create(:approved_agreement, user: @user)
end

Given(/^I have an agreement with mid\-year progress$/) do
  @report = FactoryGirl.create(:agreement_with_mid_year_review, user: @user)
end

Given(/^I have an agreement and mid\-year review approved$/) do
  @report = FactoryGirl.create(:agreement_with_mid_year_approved, user: @user)
end

Given(/^I have an agreement, mid\-year review and end\-year review in progress$/) do
  @report = FactoryGirl.create(:agreement_with_end_year_review, user: @user)
end
