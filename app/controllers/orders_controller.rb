class OrdersController < ApplicationController
  def index
    @orders = Order.where("user_id = ?", current_user.id)
  end

  def create
    cart.each do |card|
      subtotal = card.price * session[:shopping_cart].count(card.id)
      pst = subtotal * current_user.province.pst
      gst = subtotal * current_user.province.gst
      hst = subtotal * current_user.province.hst

      @order = Order.create(user_id:  current_user.id,
                            name:     card.name,
                            price:    card.price,
                            quantity: session[:shopping_cart].count(card.id),
                            PST:      pst,
                            GST:      gst,
                            HST:      hst,
                            total:    subtotal + pst + gst + hst,
                            address:  current_user.province.name,
                            status:   "Pending")
    end

    return unless user_signed_in?
    return unless @order.save

    cart.each do |card|
      session[:shopping_cart].delete(card.id)
    end

    redirect_to success_path
  end

  def destroy
    #   id = params[:id].to_i
    #   session[:shopping_cart].delete(id)
    #   redirect_to cart_index_path

    @order_delete = Order.find(params[:id])
    @order_delete.destroy

    redirect_to orders_path
  end
end
