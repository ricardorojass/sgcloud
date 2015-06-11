module ApplicationHelper
  def title
    content_for?(:title) ? yield(:title) : "SG Cloud"
  end
end
