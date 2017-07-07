module ListsHelper
  def render_add_task(f)
    if current_page?(:action => "new") || current_page?(:action => "show")
      render :partial => "add_task", :locals => { :f => f }
    end
  end
end
