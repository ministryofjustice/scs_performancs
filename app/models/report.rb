class Report < ActiveRecord::Base
  default_scope { order(:id) }

  def approved?
    !approved_at.nil?
  end

  def mid_year_approved?
    !mid_year_approved_at.nil?
  end
end
