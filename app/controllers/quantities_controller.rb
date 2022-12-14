class QuantitiesController < ApplicationController
  def create
    id = params[:id].to_i
    cart_qty = params[:cart_qty].to_i

    if cart_qty > session[:shopping_cart].count(id) && session[:shopping_cart].count(id) != 0
      number = cart_qty - session[:shopping_cart].count(id)

      number.times do
        session[:shopping_cart] << id
      end

    else
      number = session[:shopping_cart].count(id) - cart_qty

      number.times do
        session[:shopping_cart].delete_at(session[:shopping_cart].rindex(id))
      end

    end
    redirect_to cart_index_path
  end
end
