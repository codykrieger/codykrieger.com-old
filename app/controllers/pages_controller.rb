class PagesController < ApplicationController
  
  rescue_from ActionView::MissingTemplate do |exception|
    if exception.message =~ %r{Missing template pages/}
      # raise ActionController::RoutingError, "No such page: #{params[:slug]}"
      # render the 404 page if we still haven't found what we're looking for
      render '/public/404.html', :layout => nil, :status => 404
    else
      raise exception
    end
  end

  def dynamic_page
    begin
      # try to render the page as-is
      render :template => current_page
    rescue
      raise $! unless $!.kind_of? ActionView::MissingTemplate

      # try to render the slug/index if the page we're looking for
      # is the index of a folder
      render :template => "#{current_page}/index"
    end
  end

  def subnav
    # magic method to render a given folder's subnav partial
    begin
      subnav = render :partial => "#{current_page}/menu", :layout => "menu_template"
      subnav.first unless subnav.nil?
    rescue
      begin
        subnav = render :partial => "#{page_root}/menu", :layout => "menu_template"
      rescue
      end
    end
    subnav.first unless subnav.nil?
  end

protected

  def current_page
    "pages/#{params[:slug].to_s.downcase}"
  end

  def page_root
    "pages/#{params[:slug].to_s.downcase.gsub /^([^\/]+)(\/.+)+$/, '\1'}"
  end
end
