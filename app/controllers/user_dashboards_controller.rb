class UserDashboardsController < ApplicationController
  before_filter :authenticate_user!
  def index
  	@personals = Personal.includes(:user).all
  	@projects = Project.includes(:company)
  end
end
