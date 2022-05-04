class SessionsController < ApplicationController
  
  # before_action :require_user_logged_in!

  def new
  end

  def create
    case params[:option]
    when 'User'
      login_user
    when 'Shop'
      login_shop
    end
  end

  def login_user
    user = User.find_by(email: params[:email])
    if user.present? && user.authenticate(params[:password]) 
      session[:login_id] = user.id
      session[:login_type] = params[:option] 
      redirect_to shops_path, notice: 'Logged in successfully by user'
    else
      redirect_to root_path, notice: 'invalid email and password'
    end
  end

  def login_shop
    shop = Shop.find_by(email: params[:email])
    if shop.present? && shop.authenticate(params[:password]) 
      session[:login_id] = shop.id
      session[:login_type] = params[:option] 
      redirect_to orders_path, notice: 'Logged in successfully by shopkeeper.'
    else
      redirect_to root_path, notice: 'invalid email and password'
    end
  end

  

  def destroy
    binding.pry
    session[:login_id] = nil
    session[:login_type] = nil
    redirect_to root_path, notice: 'Logged Out'
  end
end

