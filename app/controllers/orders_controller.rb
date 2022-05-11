class OrdersController < ApplicationController
  protect_from_forgery with: :null_session
  #before_action :authenticate_user!
  # before_action :set_order , only: [:show, :edit, :update, :destroy]

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find_by(id: params[:id])
  
  end

  def new
    @order = Order.new 
  end

  def create
    @user_id = @current_object.id
    @order = Order.new(order_params.merge(user_id: @user_id))
    if @order.save 
      all_menu_id = params[:order][:menus_attributes].map{|i| i[:menu_id]}   
      all_menu_quantity = params[:order][:menus_attributes].map{|i| i[:quantity]}
      all_values = all_menu_id.zip(all_menu_quantity)  
      all_values.each do |menu_id,quantity|
        OrderMenu.create(menu_id: menu_id ,order_id:  @order.id,quantity: quantity)
      end
      redirect_to @order
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to @order
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to root_path, status: :see_other
  end

  private 

    def order_params
      params["order"]["menus_attributes"].delete_if{|m| m["menu_selected"] == "false"}
      params.permit(:shop_id, menus_attributes: [:menu_id, :quantity])
    end
end