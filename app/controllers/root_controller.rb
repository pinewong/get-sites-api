class RootController < ActionController::API
  def index
    routes_path = '/rails/info/routes'
    redirect_to routes_path
  end
end
