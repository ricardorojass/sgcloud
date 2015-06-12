module ApplicationHelper
  # Return the full title on a pair-page.
  def full_title(page_title = '')
    base_title = "SG Cloud"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
end
