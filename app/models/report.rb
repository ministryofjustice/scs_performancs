class Report < ActiveRecord::Base
  belongs_to :user

  default_scope { order(:id) }

  def approved?
    !approved_at.nil?
  end

  def mid_year_approved?
    !mid_year_approved_at.nil?
  end

  def end_year_approved?
    !end_year_approved_at.nil?
  end

  def approve!(stage, comment)
    stage_prefix = stage == :initial ? '' : "#{stage}_"

    update(
      "#{stage_prefix}approved_comment" => comment,
      "#{stage_prefix}approved_at" => Time.now,
      "#{stage_prefix}approved_snapshot_development" => development,
      "#{stage_prefix}approved_snapshot_smart" => smart
    )
  end
end
