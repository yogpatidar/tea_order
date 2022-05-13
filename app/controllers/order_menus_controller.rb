class OrderMenusController < ApplicationController
  def create
    @order = current_order
    @order_menu = Order_menu.new(order_params)
    if @order_menu.save
      session[:order_id] = @order.id

      redirect_to @order_menu
    else
      render :new, status: :unprocessable_entity
    end
  end

  def order_params
    params.require(:order_menu).permit(:menu_id, :order_id)
  end

end




