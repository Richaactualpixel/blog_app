class ApplicationController < ActionController::API
	acts_as_token_authentication_handler_for User
	# protect_from_forgery with: :exception

end
