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
