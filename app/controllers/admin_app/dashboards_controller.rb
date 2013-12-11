class AdminApp::DashboardsController < AdminAppController
  def index
  	@index = "active"
  	@projects = Project.all
  end
end
