class ApplicationController < ActionController::Base
  before_action :current_object
  add_flash_types :info, :error, :warning

  def already_logged_in?
    @current_object.present?
  end

  def current_object
    @current_object = find_session
  end

  def require_user_logged_in!
    redirect_to root_path unless @current_object.present? 
  end

  def find_session
    case session[:login_type]
    when 'User'
      User.find_by(id: session[:login_id])
    when 'Shop'   
      Shop.find_by(id: session[:login_id])
    end
  end

end

