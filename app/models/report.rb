# A Report represents the contents of the paper form titled
# "SCS Performance Management Report".
class Report < ActiveRecord::Base

  belongs_to :user

  include IdOrdered
  include ApprovalStages

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
