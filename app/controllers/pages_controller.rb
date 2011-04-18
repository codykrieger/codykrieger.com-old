class PagesController < ApplicationController
  
  rescue_from ActionView::MissingTemplate do |exception|
    if exception.message =~ %r{Missing template pages/}
      # raise ActionController::RoutingError, "No such page: #{params[:slug]}"
      render '/public/404.html', :layout => nil, :status => 404
    else
      raise exception
    end
  end

  def dynamic_page
    begin
      render :template => current_page
    rescue
      render :template => "#{current_page}/index"
    end
  end

protected

  def current_page
    template_path = params[:slug].to_s.downcase
    "pages/#{template_path}"
  end
  
end
