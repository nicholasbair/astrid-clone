module ApplicationHelper
  def form_wrapper
    content_tag :div, :class => 'row' do
      content_tag :div, :class => 'col-md-6 col-md-offset-3 form-card' do
        yield
      end
    end
  end

  def flash_class(type)
    case type
    when "error" then "danger"
    when "notice" then "success"
    when "alert" then "warning"
    end
  end

  def flash_wrapper(type)
    if flash[type]
      content_tag :div, :id => "flash_#{type}", :class => "alert alert-#{flash_class(type)} alert-dismissible" do
        yield
      end
    end
  end

  def sort_by(items, qualifier)
    items.select { |i| i.status == qualifier }
  end
end
