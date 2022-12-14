class ApplicationController < ActionController::Base
  before_action :initialize_session
  helper_method :cart

  def initialize_session
    session[:shopping_cart] ||= []
    session[:qty] = 0
    session[:subtotal] = 0
    session[:pst] = 0
    session[:gst] = 0
    session[:hst] = 0
    session[:total] = 0

    @provinces = Province.all
    @clans = CardClan.all
  end

  def cart
    Card.find(session[:shopping_cart])
  end

  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :province_id) }
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:email, :password, :current_password, :province_id)
    end
  end
end
