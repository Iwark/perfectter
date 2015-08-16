module ApplicationHelper
  def nav_list(name1, name2, &block)
    if name1 == name2
      content_tag(:li, {class: 'active'}, &block)
    else
      content_tag(:li, {}, &block)
    end
  end
end
