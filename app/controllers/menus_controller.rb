class MenusController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    @menus = Menu.all 
  end

  def show
    @menu = Menu.find_by(id: params[:id])
  end

  def new
    @menu = Menu.new
  end

  def create
    @shop_id = @current_object.id
    @menu = Menu.new(menu_params)
    if @menu.save
      ShopMenu.create(shop_id: @shop_id,menu_id: @menu.id)
      redirect_to @menu
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @menu = Menu.find(params[:id])
  end

  def update
    @menu = Menu.find(params[:id])

    if @menu.update(menu_params)
      redirect_to @menu
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @menu = User.find(params[:id])
    @menu.destroy
    redirect_to root_path, status: :see_other
  end
 
 
  private
    def menu_params
      params.require(:menu).permit(:menu_id, :name, :price, :quantity)
    end  
end

