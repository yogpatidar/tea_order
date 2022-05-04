class OrderMenusController < ApplicationController

  def show
  end

  def create
  
    @order_menu = Order_menu.new(order_params)
    if @order_menu.save
      redirect_to @order_menu
    else
      render :new, status: :unprocessable_entity
    end
  end

  def order_params
    params.require(:order_menu).permit(:menu_id, :shop_id)
  end

end
