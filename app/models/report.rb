class Report < ActiveRecord::Base
  default_scope { order(:id) }

  def approved?
    !approved_at.nil?
  end

  def mid_year_approved?
    !mid_year_approved_at.nil?
  end

  def approve!(comment)
    update(
      approved_comment: comment,
      approved_at: Time.now,
      approved_snapshot_development: development,
      approved_snapshot_smart: smart
    )
  end
end
