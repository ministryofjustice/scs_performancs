# Represents the contents of the paper form titled
# "SCS Performance Management Report".
class ManagementReport < Report

  enum final_rating: [ :no_rating, :outstanding, :good, :must_improve ]

  def approve!(stage, comment, final_rating=nil)
    stage_prefix = stage == :initial ? '' : "#{stage}_"

    attributes = {
      "#{stage_prefix}approved_comment" => comment,
      "#{stage_prefix}approved_at" => Time.now,
      "#{stage_prefix}approved_snapshot_development" => development,
      "#{stage_prefix}approved_snapshot_smart" => smart
    }

    attributes.merge!(final_ratting: final_rating) if final_rating

    update(attributes)
  end

end
