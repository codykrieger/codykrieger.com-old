class Admin::UsersController < Admin::BaseController
  before_filter :find_user, :only => [:edit, :update, :destroy]
    
  def find_user
    @user = User.find(params[:id])
  end
  
  def index
    @users = User.paginate :page => params[:page], :per_page => 50
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.accessible = [:role_ids] if current_user.role? :admin
    @user.attributes = params[:user]
    if @user.save
      flash[:notice] = "User created!"
      redirect_to admin_users_url
    else
      render :action => 'new'
    end
  end

  def edit
  end

  def update
    params[:user].delete(:password) if params[:user][:password].blank?
    params[:user].delete(:password_confirmation) if params[:user][:password].blank? and params[:user][:password_confirmation].blank?
    @user.accessible = [:role_ids] if current_user.role? :admin
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated #{@user.name}."
      redirect_to admin_users_url
    else
      render :action => 'edit'
    end
  end

  def destroy
    @user.destroy
    flash[:notice] = "User deleted."
    redirect_to admin_users_url
  end

end
