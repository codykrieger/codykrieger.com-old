class PagesController < BlueSparks::PagesController

  def subnav
    # magic method to render a given folder's subnav partial
    begin
      subnav = render :partial => "#{current_page}/menu", :layout => "menu_template"
      subnav.first unless subnav.nil?
    rescue
      # logger.info "subnav error: #{$!}"

      begin
        subnav = render :partial => "#{page_root}/menu", :layout => "menu_template"
      rescue
        # logger.info "subnav error: #{$!}"
      end
    end

    # logger.info "#{subnav.inspect}"
    (subnav.first if subnav.kind_of? Array) || subnav
  end

end
