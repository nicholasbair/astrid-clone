module ListsHelper
  def render_add_task(f)
    if params[:action] != "edit"
      render :partial => "add_task", :locals => { :f => f }
    end
  end

  def print_due_date(list)
    list.deadline.time.localtime.strftime("%b %e, %l:%M %p")
  end

  def render_deadline(list)
    if list.deadline && !list.complete?
      render :partial => "deadline", :locals => { :list => list }
    end
  end

  def render_deadline_form(f)
    if current_user.phone_number && current_user.time_zone
      render :partial => "deadline_form", :locals => { :f => f }
    end
  end
end
