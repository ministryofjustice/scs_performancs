module ApprovalStages
  extend ActiveSupport::Concern

  def approved?
    !approved_at.nil?
  end

  def mid_year_approved?
    !mid_year_approved_at.nil?
  end

  def end_year_approved?
    !end_year_approved_at.nil?
  end

end
