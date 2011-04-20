module ApplicationHelper
  
  # head and meta
  
  def title(t1, *args)
    content_for :title do
      "<h1 id='title'>#{t1}</h1>".html_safe unless t1.to_s.empty?
    end
    content_for :title_tag do
      "#{args[0] || t1} - "
    end
  end
  
  def metadesc(text)
    unless text.to_s.empty?
      content_for :meta_desc do
        text
      end
    end
  end
  
  def stylesheets(*args)
    args.each do |arg|
      content_for :stylesheets do
        stylesheet_link_tag arg
      end
    end
  end
  
  def javascripts(*args)
    args.each do |arg|
      content_for :end_scripts do
        javascript_include_tag arg
      end
    end
  end
  
  def active_page?(path, retval, head=false)
    return retval if request.fullpath.starts_with?(path) && head && path != "/"
    return retval if request.fullpath == path
  end
end
