class OrdersController < ApplicationController
  protect_from_forgery with: :null_session
  #before_action :authenticate_user!
  before_action :set_order , only: [:show, :edit, :update, :destroy]
  
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find_by(id: params[:id])
  end

  def new
    @order = Order.new
    @shop_id = params[:shop_id]  
  end

  def create
    @order = Order.new(order_params)
    if @order.save
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
      params.permit(:user_id, :menu_id, :shop_id)
    end  

end
