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

    redirect_back_or_to request.params
  end

  def destroy
    id = params[:id].to_i
    session[:shopping_cart].delete(id)
    redirect_to cart_index_path
  end
end
