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
end
