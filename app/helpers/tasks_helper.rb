module TasksHelper
  def render_status_buttons(statuses)
    statuses.collect do |status|
      render :partial => 'status_form', :locals => { :task_status => status }
    end.join.html_safe
  end

  def update_status(task)
    render_status_buttons(Task.statuses.keys.find_all { |k| k != task.status })
  end
end
