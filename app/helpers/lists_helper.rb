module ListsHelper
  def sort_lists(lists, status)
    lists.select { |l| l.status == status }
  end
end
