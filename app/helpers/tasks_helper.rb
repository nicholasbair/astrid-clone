module TasksHelper
  def render_status_buttons(statuses)
    statuses.collect do |status|
      render :partial => 'status_form', :locals => { :task_status => status }
    end.join.html_safe
  end

  def update_status(task)
    case task.status
    when "complete"
      render_status_buttons(["incomplete", "in_progress"])
    when "in_progress"
      render_status_buttons(["incomplete", "complete"])
    when "incomplete"
      render_status_buttons(["complete", "in_progress"])
    end
  end
end
