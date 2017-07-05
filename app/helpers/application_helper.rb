module ApplicationHelper
  def form_wrapper
    content_tag :div, :class => 'row' do
      content_tag :div, :class => 'col-md-6 col-md-offset-3 form-card' do
        yield
      end
    end
  end
end
