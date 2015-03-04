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

  def comment_heading
    if @report.is_a?(Agreement)
      'Please comment on your achievements to date'
    else
      'Additional comments'
    end
  end

  def objective_blank?(objective)
    objective['what'].blank? && objective['how'].blank?
  end

  def review_comment_label(stage)
    whose = (@report.user == current_user) ? 'Your' : 'Employee'
    "#{whose} #{stage} review comments"
  end

  def display_date(datetime)
    datetime.to_date.to_s(:short)
  end
end
