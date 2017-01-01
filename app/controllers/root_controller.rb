# The root response, redirect to Rails routes info path.
class RootController < ActionController::API
  def index
    routes_path = '/rails/info/routes'
    redirect_to routes_path
  end
end
