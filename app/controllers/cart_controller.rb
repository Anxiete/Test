class CartController < ApplicationController
  def index
    @brands = CardClan.all
    @order = Order.new
  end

  def create
    id = params[:id].to_i
    session[:shopping_cart] << id
    card = Card.find(id)
    flash[:notice] = "Added #{card.name} added to cart."

    redirect_to root_path
  end

  def destroy
    id = params[:id].to_i
    session[:shopping_cart].delete(id)
    redirect_to cart_index_path
  end

  def orders
    @clans = CardClan.all
    @orders = Order.where("user_id LIKE ?", current_user.id)
  end
end
