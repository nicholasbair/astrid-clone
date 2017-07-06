module ApplicationHelper
  def form_wrapper
    content_tag :div, :class => 'row' do
      content_tag :div, :class => 'col-md-6 col-md-offset-3 form-card' do
        yield
      end
    end
  end

  def flash_wrapper(type)
    if flash[type]
      content_tag :div, :id => "flash_#{type}", :class => "alert alert-danger alert-dismissible" do
        flash[:notice]
        yield
      end
    end
  end
end
