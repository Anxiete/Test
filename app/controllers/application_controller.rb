class ApplicationController < ActionController::Base    
    before_action :initialize_session 
    helper_method :cart
    
    def initialize_session
        session[:shopping_cart] ||=[]
    end

    def cart
        Card.find(session[:shopping_cart])
    end
    
    protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :province_id)}
    end
end
