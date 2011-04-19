class ApplicationController < ActionController::Base
  protect_from_forgery
  
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access Denied"
    redirect_to root_url
  end
  
  before_filter :set_vars
  
private

  def set_vars
    @desc = "developer of high-quality web, mobile & desktop applications"
  end
  
end
