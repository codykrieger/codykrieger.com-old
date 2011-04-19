class Admin::BaseController < ApplicationController
  layout 'admin'
  ssl_exceptions

  before_filter :authenticate_user!
  before_filter :verify_admin

private
  def verify_admin
    redirect_to root_url unless current_user.role? :admin
  end
end
