module ApplicationHelper

  def approval_heading
    if @report.is_a?(Agreement)
      'Approve performance agreement'
    elsif @approval_id == :initial
      'Approve objectives'
    else
      "Approve #{@approval_id.to_s.titleize} Review"
    end
  end
end
