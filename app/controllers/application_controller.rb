class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Basic::ControllerMethods
  include ActionController::HttpAuthentication::Token::ControllerMethods

  def authenticate_user!
   raise UnauthenticatedError unless current_user
 end

 def current_user
   @current_user ||= authenticate_with_http_token { |token, options| User.find_by(auth_token: token) }
 end
end
