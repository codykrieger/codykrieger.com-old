module ApplicationHelper
  
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
  
  def current_page?(path, retval, sidebar=false)
    return retval if request.fullpath.starts_with?(path) && path != '/' && path != '/admin' && !sidebar
    return retval if request.fullpath == path
  end
  
end
