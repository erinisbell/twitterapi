class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Basic::ControllerMethods
  include ActionController::HttpAuthentication::Token::ControllerMethods
  include Pundit

  UnauthorizedError  = Class.new(ActionController::ActionControllerError)
  rescue_from Pundit::NotAuthorizedError, with: :unauthorized

  def authenticate_user!
    raise UnauthenticatedError unless current_user
  end

  def authenticate!
    authenticate_user!
  end

  def current_user
    User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end

  def unauthorized(error)
    head :forbidden
  end

end
