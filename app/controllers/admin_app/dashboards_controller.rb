class AdminApp::DashboardsController < AdminAppController
  before_filter :authenticate_admin_user!
  def index
  	@projects = Project.all
  end
end
