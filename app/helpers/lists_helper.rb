module ListsHelper
  def sort_lists(lists, status)
    lists.select { |l| l.status == status }
  end

  def render_add_task(f)
    render :partial => "add_task", :locals => { :f => f } if current_page?(:action => "new")
  end
end
