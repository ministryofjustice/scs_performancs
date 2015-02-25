# Represents the contents of the paper form titled
# "SCS Performance Agreement Form".
class Agreement < Report

  def approve!(stage, comment)
    stage_prefix = stage == :initial ? '' : "#{stage}_"

    update(
      "#{stage_prefix}approved_comment" => comment,
      "#{stage_prefix}approved_at" => Time.now,
      "#{stage_prefix}approved_snapshot_agreement" => agreement
    )
  end

end
