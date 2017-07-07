module ListsHelper
  def render_add_task(f)
    if current_page?(:action => "new") || current_page?(:action => "show")
      render :partial => "add_task", :locals => { :f => f }
    end
  end

  def print_due_date(list)
    list.due_date.strftime("%m/%d/%Y")
  end
end
