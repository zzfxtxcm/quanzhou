module ApplicationHelper

  def full_title(page_title)
    base_title = "馨窝网www.xinwo360.com 漳州房地产团购、电商第一门户"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
end
