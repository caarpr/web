class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def require_basic_auth!
    return if authenticate_with_http_basic do |username, password|
      username == "northside" && password == ENV['BASIC_AUTH_PASSWORD']
    end

    request_http_basic_authentication 
  end
end
