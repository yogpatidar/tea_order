class ShopsController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :require_user_logged_in!, only:[:show, :index]
  
  def index
    @shops = Shop.all
  end

  def show
    @shop = Shop.find_by(id: params[:id])
    @menus = @shop.menus
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    if @shop.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @shop = Shop.find_by(params[:id])
  end

  def update
    @shop = Shop.find_by(params[:id])

    if @shop.update(shop_params)
      redirect_to @shop
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @shop = Shop.find_by(params[:id])
    @shop.destroy
    redirect_to root_path, status: :see_other
  end

  private

    def shop_params  
      params.require(:shop).permit(:profile_image , :name, :password, :password_confirmation, :email, :city, :address, :phone, :pin_code)
    end  
end
