class UserDashboardsController < ApplicationController
  before_filter :authenticate_user!
  def index
  	@personals = Personal.find(:all)
  	@projects = Project.includes(:company)
  end
end
